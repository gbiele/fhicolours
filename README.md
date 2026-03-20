# fhicolours

ggplot2 colour and fill scales based on [Folkehelseinstituttet](https://www.fhi.no/en/) (FHI / Norwegian Institute of Public Health) palette guidance—qualitative sets, sequential ramps (`b1`, `b2`, `r1`, `gr1`, `gu1`), and a diverging ramp (`diverging_b2_r1`).

## Installation

The source repository is [**github.com/gbiele/fhicolours**](https://github.com/gbiele/fhicolours).

```r
# install.packages("devtools")
devtools::install_github("gbiele/fhicolours", build_vignettes = TRUE)
```

For a local clone, you can use `devtools::install_local(path = "path/to/fhicolours", build_vignettes = TRUE)` instead. Building vignettes requires **knitr** and **rmarkdown**.

## Usage

```r
library(ggplot2)
library(fhicolours)

# Qualitative (categories) — default discrete scale
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point() +
  scale_color_fhi(palette = "qualitative")

# Sequential (continuous)
ggplot(faithful, aes(waiting, eruptions, color = eruptions)) +
  geom_point() +
  scale_color_fhi(palette = "b2", discrete = FALSE)

# Diverging (continuous with a meaningful midpoint)
# … use scale_*_fhi(palette = "diverging_b2_r1", discrete = FALSE)
```

`scale_fill_fhi()` mirrors `scale_color_fhi()` for the `fill` aesthetic. See `?scale_color_fhi` and the package vignette.

```r
browseVignettes("fhicolours")
```

## License

MIT © package authors—see [LICENSE](LICENSE) for details.
