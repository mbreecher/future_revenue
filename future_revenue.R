setwd("C:/R/workspace/shared")
source("revenue_future_projects.r")

#import scrubbed and updated project time data
project_time <- get_revenue_data()

setwd("C:/R/workspace/future_revenue/output")
write.csv(result, file = "q22013_forward_projects_with_sales_price.csv", row.names = F, na = "")