library(dplyr)
library(ggplot2)
library(mdsr)
library(devtools)
library(roxygen2)

drg.data <- read.csv('data/DRG_data.csv')
##create a variable for the DRG code
#' Title
#'
#' @param df
#' @param payment
#'
#' @return g
#' @export
#'
#' @examples
#' @importFrom ggplot2 ggplot
drg_boxplot <- function(df, payment) {
  ##plot the average medicare payments
  View(drg.data)
  df <- df %>%
    group_by(DRG.Definition) %>%
    mutate(DRG = strsplit(as.character(DRG.Definition),
    split = ' ')[[1]][1]) %>%
    ungroup()
  g <- ggplot(df, aes(x = DRG.Definition,
                      y = payment)) +
    scale_y_continuous(trans='log10') +
    geom_boxplot(outlier.shape = NA) +
    theme(axis.text.x = element_text(angle = 90,
                                     size = 6,
                                     hjust = 1)) +
    ylab('Log Average Payments') +
    xlab('DRG Code') +
    ggtitle('Average Payments for Hospitals by DRG Code')
  g
}

drg_boxplot(drg.data, drg.data$Average.Medicare.Payments)


