##img=raster
##trainData=vector
##responseCol=field trainData
##nsamples=number 1000
##output=output raster
library(sp)
library(raster)
library(caret)

names(img) <- paste0("B", c(1:5, 7))

dfAll = data.frame(matrix(vector(), 0, length(names(img)) + 1))

for (i in 1:length(unique(trainData[[responseCol]]))){
  category <- unique(trainData[[responseCol]])[i]
  categorymap <- trainData[trainData[[responseCol]] == category,]
  dataSet <- extract(img, categorymap)
  dataSet <- dataSet[!unlist(lapply(dataSet, is.null))]
  dataSet <- lapply(dataSet, function(x){cbind(x, class = as.numeric(rep(category, nrow(x))))})
  df <- do.call("rbind", dataSet)
  dfAll <- rbind(dfAll, df)
}

sdfAll <- dfAll[sample(1:nrow(dfAll), nsamples), ]

modFit_rf <- train(as.factor(class) ~ B3 + B4 + B5, method = "rf", data = sdfAll)

beginCluster()
preds_rf <- clusterR(img, raster::predict, args = list(model = modFit_rf))
endCluster()

output = preds_rf