

<!-- README.md is generated from README.qmd. Please edit that file -->

# ggsegIca <img src='man/figures/logo.png' align="right" height="138.5" />

<!-- badges: start -->

[![R-CMD-check](https://github.com/ggsegverse/ggsegIca/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/ggsegverse/ggsegIca/actions/workflows/R-CMD-check.yaml)
[![r-universe](https://ggseg.r-universe.dev/badges/ggsegIca.png)](https://ggseg.r-universe.dev/ggsegIca)
<!-- badges: end -->

This package contains dataset for plotting the ICA atlas for ggseg.

Beckmann CF & Smith SM (2004). Probabilistic independent component
analysis for functional magnetic resonance imaging. *IEEE Transactions
on Medical Imaging*, 23(2), 137-152.

## Installation

We recommend installing the ggseg-atlases through the ggseg
[r-universe](https://ggseg.r-universe.dev/ui#builds):

``` r
options(repos = c(
  ggseg = "https://ggseg.r-universe.dev",
  CRAN = "https://cloud.r-project.org"
))

install.packages("ggsegIca")
```

You can install this package from [GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("ggsegverse/ggsegIca")
```

## ICA atlas

``` r
library(ggseg)
library(ggsegIca)
library(ggplot2)

ggplot() +
  geom_brain(
    atlas = ica(),
    mapping = aes(fill = label),
    position = position_brain(hemi ~ view),
    show.legend = FALSE
  ) +
  scale_fill_manual(values = ica()$palette, na.value = "grey") +
  theme_void()
```

<img src="man/figures/README-ica-1.png" style="width:100.0%" />

## Data source

Beckmann CF & Smith SM (2004). Probabilistic independent component
analysis for functional magnetic resonance imaging. *IEEE Transactions
on Medical Imaging*, 23(2), 137-152.
