library("ggplot2")

# To see and set the work space
setwd("C:/Users/roger/Documents/Github/DataScience/Data Visualization/R")
getwd()

df_used_cars <-read.csv("../Datasets/bar_chart_data.csv", 
                        header = TRUE, 
                        sep = ",")

#Creating a bar chart with ggplot
bar_chart <- ggplot(df_used_cars, # data layer 
                    aes(x = Brand, #aesthetics specify the x and y-axis
                        y = Cars.Listings)) + 
              geom_bar(stat = "identity", #for a bar chart we need a geom_bar
                       width = 0.8, #width of each bar
                       color = "navy", #border color of the bars
                       fill = "navy") + #fill color of the bars
              ggtitle("Cars Listings by Brand") + #adding a plot title with ggtitle
              theme_classic() + #adding a different theme with a clean design
              theme(axis.text.x = element_text(angle = 45,  #rotating the x-axis labels
                                               hjust = 1)) +
              labs(x = NULL, #removing the x-axis title
                   y = "Number of Listings") #adding a new y-axis title
bar_chart
