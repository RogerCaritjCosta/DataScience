library("ggplot2")
library("dplyr") 
library("reshape2")

df_engine_types <- read.csv("../Datasets/stacked_area_chart_data.csv",
                            header = TRUE,
                            sep = ",")
# Remove 'other' category. We have no prior information on this category
temp <- select(df_engine_types, -matches("Other"))
# Combine diesel, petrol and gas categories into one column, to create the stacked area chart. 
# The new data has 3 columns - Year, Variable and Value. Variable shows the engine fuel category.
# Value displayes the number of cars sold for the respective year and from that category.
new_engine_types <- melt(temp, id.vars = "Year")
# Create a stacked area chart with ggplot2. For an area chart, the required geometry is 'geom_area'
area_chart <- ggplot (new_engine_types, # data layer
                      aes(x = Year, # aesthetics
                          y = value,
                          fill = variable)) +
  geom_area() +
  scale_fill_manual(values = c("#ef2026", #custom colors for each of the three categories
                               "#7e2987",
                               "#011638")) +
  theme_classic() +
  theme(legend.justification = c(0.01, 1), #specify a legend position
        legend.position = c(0.01, 1)) +
  labs(fill = "Engine Type") + #title name
  ylab("Number of Cars") + #y-axis name
  ggtitle("Popularity of Engine Fuel Types (1982 - 2016)") + #charts title
  theme(axis.text.x = element_text(angle = 90, #adding x-axis labels for each years and rotating them for better readability 
                                   vjust = 0.5)) +
  scale_x_continuous(breaks = new_engine_types$Year)

area_chart  

