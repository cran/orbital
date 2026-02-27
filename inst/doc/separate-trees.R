## -----------------------------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
# library(orbital)
# library(parsnip)
# library(xgboost)
# 
# # Fit an XGBoost model
# bt_spec <- boost_tree(mode = "regression", engine = "xgboost", trees = 100)
# bt_fit <- fit(bt_spec, mpg ~ ., mtcars)
# 
# # Default: single combined expression
# orb_combined <- orbital(bt_fit)
# length(orb_combined)
# #> [1] 1
# 
# # Separate trees: one expression per tree, plus batch sums, plus final sum
# orb_separate <- orbital(bt_fit, separate_trees = TRUE)
# length(orb_separate)
# #> [1] 103
# # (100 trees + 2 batch sums + 1 final .pred)

## -----------------------------------------------------------------------------
# # Intermediate columns are excluded from output
# preds <- predict(orb_separate, new_data)
# names(preds)
# #> [1] ".pred"

## -----------------------------------------------------------------------------
# library(DBI)
# library(duckdb)
# 
# con <- dbConnect(duckdb())
# dbWriteTable(con, "my_data", large_dataset)
# tbl <- tbl(con, "my_data")
# 
# # Benchmark both approaches
# bench::mark(
#   combined = predict(orb_combined, tbl) |> collect(),
#   separate = predict(orb_separate, tbl) |> collect(),
#   check = FALSE
# )

