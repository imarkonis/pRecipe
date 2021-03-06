library(rNOMADS)
library(raster)
library(data.table)
library(dplyr)

year_select <- "1958"
month_select <- "08"
end_date <- as.Date(paste0(year_select, "-", month_select, "-01"))
precip <- ReadGrib("../data/ERA40/full_data_v7_05.nc")
precip <- precip*as.numeric(days_in_month(end_date))