library(ncdf4)
library(raster)
library(data.table)
library(dplyr)

start_month <- "2003-08"
end_month <- "2003-12"
month_array <- seq(as.Date("2003-01-01"), as.Date("2018-12-01"), by="months") %>% format("%Y-%m")
month_index <- which(month_array %in% c(start_month,end_month))
month_index[2] <- month_index[2] - month_index[1] + 1
ncin <- nc_open("../data/PERSIANN_CCS/CCS_2019-12-12055412am.nc")
precip <- ncvar_get(ncin, 'precip', start = c(1, 1, month_index[1]), count = c(-1, -1, month_index[2])) %>% brick()