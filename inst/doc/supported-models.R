## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(orbital)

## -----------------------------------------------------------------------------
all_funs <- ls(getNamespace("orbital"))

steps <- grep("orbital.step_", all_funs, value = TRUE)
steps <- gsub("orbital.", "", steps)

## ----results='asis'-----------------------------------------------------------
cat(paste0("- `", steps, "()`\n"))

