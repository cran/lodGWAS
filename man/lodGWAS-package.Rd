\name{lodGWAS-package}
\alias{lodGWAS-package}
\alias{lodGWAS}
\docType{package}
\title{
  Genome-Wide Association Analysis of a Biomarker Accounting for
  Limit of Detection
}
\description{
  Statistical analysis of a biomarker is often complicated
  because the detection range of the assay of the biomarker is
  restricted. The limits of detection (LOD) are the floor and/or
  ceiling values of the biomarker that can be accurately measured
  by a particular assay type. Any value of the biomarker beyond
  the range of LOD, either smaller than the lower LOD or larger
  than the upper LOD, cannot be determined accurately. Those
  observations, so-called non-detects (NDs), cannot simply be
  excluded from the analysis, because NDs are not 'missing at
  random'. They can be considered as censored data, and can
  therefore be best analyzed by using statistical methods for
  survival analysis.

  lodGWAS is a flexible package for running genome-wide association
  analysis of a biomarker that accounts for the problem of
  limit of detection of the assay. It treats non-detected values
  as censored, and performs a parametric survival analysis on
  the phenotype of interest.
  
  The analysis itself is carried out by the function \code{\link{lod_GWAS}}.
  A second function, \code{\link{lod_QC}}, can be used to check
  if the coding of LOD values in the phenotype file is correct.
}
\details{
\tabular{ll}{
Package: \tab lodGWAS\cr
Type: \tab Package\cr
Version: \tab 1.0-6\cr
Date: \tab 2015-10-21\cr
License: \tab GPL (>= 3)\cr
}
}
\author{
Ahmad Vaez, Ilja M. Nolte, Peter J. van der Most

Maintainer: Ilja M. Nolte <i.m.nolte@umcg.nl>
}
\keyword{ package }
