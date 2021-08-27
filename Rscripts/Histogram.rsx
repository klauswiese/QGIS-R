##plots=group
##Layer=vector
##Data=Field Layer
##Data_Name=string data
##showplots

library(ggplot2)

DF <- ggplot(NULL, aes(x= Layer[[Data]])) +
      geom_histogram(fill= "red", 
                     colour= "black") +
      labs(x = Data_Name)

plot(DF)
