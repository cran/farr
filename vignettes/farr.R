## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(farr)

## ---- message=FALSE-----------------------------------------------------------
library(farr)
library(dplyr, warn.conflicts = FALSE)

df <- 
    tibble(x = rnorm(100)) %>%
    mutate(dec_x = form_deciles(x))

df

## ---- message=FALSE-----------------------------------------------------------
library(farr)
library(dplyr, warn.conflicts = FALSE)

df <- 
    tibble(x = rnorm(500)) %>%
    mutate(win_x = winsorize(x),
           trunc_x = truncate(x)) %>%
    arrange(x)

df

df %>% arrange(desc(x))

## -----------------------------------------------------------------------------
idd_periods <- get_idd_periods(min_date = "1994-01-01", 
                               max_date = "2010-12-31")
idd_periods

