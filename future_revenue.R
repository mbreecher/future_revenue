setwd("C:/R/workspace/shared")
source("revenue_future_projects.r")

#import scrubbed and updated project time data
project_time <- get_revenue_data()

project_time <- project_time[project_time$Quarter.End >= Sys.Date(),] #future only
#remove those without opportunity info (no price information) impact is small (28/1880)
project_time <- project_time[!is.na(project_time$opportunity_id) & !project_time$opportunity_id %in% c("") &
                               !is.na(project_time$sales_price),]

project_time <- project_time[,!names(project_time) %in% c("Goodwill.Hours.Available", "reportingOffset", "opportunity_id", "filingPeriod", "Opportunity.18.Digit.Id")]

#make list price sales price if list price == 0
# project_time[project_time$sales_price %in% 0,]$sales_price <- project_time[project_time$sales_price %in% 0,]$list_price
#make list price sales price if sales price > list
# project_time[project_time$list_price < project_time$sales_price,]$list_price <- project_time[project_time$list_price < project_time$sales_price,]$sales_price


setwd("C:/R/workspace/future_revenue/output")
write.csv(project_time, file = "future_projects_with_sales_price.csv", row.names = F, na = "")
