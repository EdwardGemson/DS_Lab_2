stat_calc <- function(df_col, calc) {
  calc(df_col)
}
stat_calc(drg.data$Average.Medicare.Payments, sd)
