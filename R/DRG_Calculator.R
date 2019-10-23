library(dplyr)
library(ggplot2)
library(mdsr)
library(devtools)
library(roxygen2)
drg.data <- read.csv('data/DRG_data.csv')
#' Title
#'
#' @param df_col
#' @param calc
#'
#' @return
#' @export
#'
#' @examples
stat_calc <- function(df_col, calc) {
  calc(df_col)
}
stat_calc(drg.data$Average.Medicare.Payments, sd)
