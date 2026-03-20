# fhicolours

ggplot2 colour and fill scales based on [Folkehelseinstituttet](https://www.fhi.no/en/) (FHI / Norwegian Institute of Public Health) guidance.

This package encodes palettes for **stats and plots**: qualitative colours, quantitative sequential ramps (`b1`, `b2`, `r1`, `gr1`, `gu1`), neutral ramps (**`grable`**, gråblå; **`greige`**, gray-beige), and a diverging ramp (`diverging_b2_r1`).

### About the official FHI palette

The full visual profile is documented (in Norwegian) as [**FHIs fargepalett**](https://www.fhi.no/om/fhi/visuell-profil/innhold/farger/). There, FHI states that the palette covers **main colours** (blues, reds, greens, yellows), **greys** (including gråblå and greige used with the main hues), **extra** colours such as illustration tones, **backgrounds**, and **colours for statistical graphics** (graphs, maps, diagrams). The colours are meant for fhi.no, social media, and other FHI channels and products—whether produced in-house or externally.

For **graphs and maps**, FHI distinguishes **quantitative** palettes (consistent contrast across hues), **qualitative** colours that emphasize lightness contrast to support universal design (WCAG and APCA), and **diverging** palettes for numeric data with a **neutral midpoint**—with scope to add more steps from the **B2** and **R1** ramps. Qualitative colours are intended for categories **without** a natural order or hierarchy (e.g. country or group). The institute’s default **body text** colour on the same page is **`#222222`** (a soft near-black).

`fhicolours` is an independent ggplot convenience layer; always defer to the latest guidance on the FHI site for production work.

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
