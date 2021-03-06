% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/preprocessGIMMS.R
\name{preprocessGIMMS}
\alias{preprocessGIMMS}
\title{GIMMS NDVI3g.v1 Processing Chain}
\usage{
preprocessGIMMS(x, ext = NULL, keep = NULL, cores = 1L, ...)
}
\arguments{
\item{x}{\code{character}. Vector of local filepaths created e.g. from
\code{\link{downloadGimms}}. See also \code{\link{rasterizeGimms}}.}

\item{ext}{\code{Extent}, or any object from which an \code{Extent} can be
extracted, see \code{\link[raster]{crop}}.}

\item{keep}{\code{integer}. Flag values of NDVI3g.v1 pixels to spare during
quality control, see \code{\link{rasterizeGimms}}.}

\item{cores}{\code{integer}. Number of cores for parallel computing.}

\item{...}{Additional arguments passed to \code{\link{whittaker.raster}}
(except for 'vi' and 'timeInfo').}
}
\value{
A \code{RasterStack} of Whittaker-smoothed GIMMS NDVI3g.v1 monthly value
composites.
}
\description{
This function covers the major tasks related to GIMMS NDVI3g.v1 preprocessing
including file download (\code{\link{downloadGimms}}), rasterization and
quality control (\code{\link{rasterizeGimms}}), creation of monthly value
composites (\code{\link{monthlyComposite}}), and subsequent application of
the Whittaker smoother (\code{\link{whittaker.raster}}).
}
\examples{
\dontrun{
## modis options
MODIS::MODISoptions(localArcPath = "MODIS/MODIS_ARC",
                    outDirPath = "MODIS/MODIS_ARC/PROCESSED/",
                    outProj = "+init=epsg:4326",
                    MODISserverOrder = c("LAADS", "LPDAAC"))

## clipping extent
ext <- raster::getData(country = "DEU", level = 0)

## initialize processing
rst <- preprocessGIMMS(ext = ext,
                         keep = 0)  # keep pixels flagged 'good' only

## display the first 12 months (Jul 1981 to Jun 1982)
raster::plot(rst[[1:12]])
}

}
\seealso{
\code{\link{downloadGimms}}, \code{\link{rasterizeGimms}},
\code{\link{monthlyComposite}}, \code{\link{whittaker.raster}}.
}
