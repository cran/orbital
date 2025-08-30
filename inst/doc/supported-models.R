## -----------------------------------------------------------------------------
if (!rlang::is_installed(c("gt", "tibble"))) {
  knitr::knit_exit()
}

## -----------------------------------------------------------------------------
library(gt)
library(dplyr)

tibble::tribble(
  ~parsnip,               ~engine,              ~numeric, ~class, ~prob,
  "`boost_tree()`",       "`\"xgboost\"`",      "✅",     "✅",    "✅",
  "`cubist_rules()`",     "`\"Cubist\"`",       "✅",     "❌",    "❌",
  "`decision_tree()`",    "`\"partykit\"`",     "✅",     "✅",    "✅",
  "`linear_reg()`",       "`\"lm\"`",           "✅",     "❌",    "❌",
  "`linear_reg()`",       "`\"glmnet\"`",       "⚪",     "❌",    "❌",
  "`logistic_reg()`",     "`\"glm\"`",          "❌",     "✅",    "✅",
  "`logistic_reg()`",     "`\"glmnet\"`",       "❌",     "⚪",    "⚪",
  "`mars()`",             "`\"earth\"`",        "✅",     "⚪",    "⚪",
  "`naive_Bayes()`",      "`\"naivebayes\"`",   "❌",     "⚪",    "⚪",
  "`nearest_neighbor()`", "`any`",              "❌",     "❌",    "❌", 
  "`rand_forest()`",      "`\"randomForest\"`", "✅",     "⚪",    "⚪",
  "`rand_forest()`",      "`\"ranger\"`",       "✅",     "⚪",    "⚪"
) |>
  gt() |>
  tab_spanner(
    label = "Model",
    columns = c(parsnip, engine)
  ) |>
  tab_spanner(
    label = "Regression",
    columns = c(numeric)
  ) |>
  tab_spanner(
    label = "Classification",
    columns = c(class, prob)
  ) |>
  tab_header(
    title = "Supported Prediction Types"
  ) |>
  cols_align(
    "center",
    columns = c(numeric, class, prob)
  ) |>
  tab_footnote("✅: Supported") |>
  tab_footnote("❌: Cannot be supported") |>
  tab_footnote("⚪: Not yet supported") |>
  fmt_markdown(
    columns = c(parsnip, engine)
  )

## -----------------------------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
library(orbital)

## -----------------------------------------------------------------------------
all_funs <- ls(getNamespace("orbital"))

steps <- grep("orbital.step_", all_funs, value = TRUE)
steps <- gsub("orbital.", "", steps)

## -----------------------------------------------------------------------------
cat(paste0("- `", steps, "()`\n"))

