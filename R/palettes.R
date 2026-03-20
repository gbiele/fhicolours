#' FHI Color Palettes
#'
#' Sequential ramps `grable` and `greige` are gråblå and greige from the FHI
#' visual profile (see \url{https://www.fhi.no/om/fhi/visuell-profil/innhold/farger/}),
#' ordered light to dark like the other quantitative palettes.
#'
#' @export
fhi_palettes <- list(
  qualitative = c(
    "#ec7c73", "#234e5f", "#61d2b2", "#a93c38", 
    "#f9dc8c", "#7176c9", "#09181f", "#65a9c5", 
    "#2a6a82", "#179463", "#f0af5e", "#c8e1ec", 
    "#d74b46", "#00b782", "#fda49b", "#4089a7"
  ),
  b1 = c("#fafbff", "#ebedff", "#d8ddff", "#b0b8fa", "#8e96f3", "#7176c9", "#595d9d", "#40436d", "#292b47", "#131428"),
  b2 = c("#f2fafe", "#e0f0f7", "#c8e1ec", "#8fc5dc", "#65a9c5", "#4089a7", "#2a6a82", "#234e5f", "#16323d", "#09181f"),
  gu1 = c("#fff7ee", "#faead5", "#f9dc8c", "#f0af5e", "#d39244", "#ac763a", "#83592d", "#5f4122", "#3c2917", "#221305"),
  gr1 = c("#f2fbfa", "#d9f4ed", "#b5e8d9", "#61d2b2", "#00b782", "#179463", "#396e4d", "#2d4f35", "#203323", "#0d1b0a"),
  r1 = c("#fff6f5", "#fee9e6", "#ffd2cc", "#fda49b", "#ec7c73", "#d74b46", "#a93c38", "#7b2623", "#4f1a17", "#2c0807"),
  grable = c("#edf4f7", "#dbe6ec", "#cbd9df", "#afc0c7", "#879ba5", "#435c68"),
  greige = c("#fbfbfb", "#f7f6f5", "#f0edeb", "#e0dddb", "#cfd0cb", "#767676")
)

fhi_palettes$diverging_b2_r1 <- c(
  rev(fhi_palettes$r1)[3:8],
  "#FFFFFF",
  fhi_palettes$b2[3:8]
)

#' FHI Palette Generator
#'
#' @param palette Character name of palette.
#' @param reverse Boolean indicating whether the palette should be reversed.
#' @param ... Additional arguments to pass to colorRampPalette()
#' @export
fhi_pal <- function(palette = "qualitative", reverse = FALSE, ...) {
  pal <- fhi_palettes[[palette]]
  if (is.null(pal)) stop("Palette not found.")
  if (reverse) pal <- rev(pal)
  grDevices::colorRampPalette(pal, ...)
}

#' Color scale for FHI palettes
#'
#' @param palette Character name of palette.
#' @param discrete Boolean indicating whether color aesthetic is discrete.
#' @param reverse Boolean indicating whether the palette should be reversed.
#' @param ... Additional arguments passed to discrete_scale() or scale_color_gradientn()
#' @export
scale_color_fhi <- function(palette = "qualitative", discrete = TRUE, reverse = FALSE, ...) {
  pal <- fhi_pal(palette = palette, reverse = reverse)
  if (discrete) {
    ggplot2::discrete_scale("colour", paste0("fhi_", palette), palette = pal, ...)
  } else {
    ggplot2::scale_color_gradientn(colours = pal(256), ...)
  }
}

#' Fill scale for FHI palettes
#'
#' @param palette Character name of palette.
#' @param discrete Boolean indicating whether fill aesthetic is discrete.
#' @param reverse Boolean indicating whether the palette should be reversed.
#' @param ... Additional arguments passed to discrete_scale() or scale_fill_gradientn()
#' @export
scale_fill_fhi <- function(palette = "qualitative", discrete = TRUE, reverse = FALSE, ...) {
  pal <- fhi_pal(palette = palette, reverse = reverse)
  if (discrete) {
    ggplot2::discrete_scale("fill", paste0("fhi_", palette), palette = pal, ...)
  } else {
    ggplot2::scale_fill_gradientn(colours = pal(256), ...)
  }
}