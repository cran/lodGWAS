\name{lod_QC}
\alias{lod_QC}
\title{Checking the coding of phenotype and outsideLOD values}
\description{
  It is important that the phenotype and outsideLOD values in
  the phenotype file are coded correctly. The function \code{lod_QC}
  checks the quality of the phenotype file, and provides a
  number of descriptive statistics about the phenotype, as well
  as warnings about suspected problems. 
}
\usage{
lod_QC(phenofile,
      pheno_name,
      filedirectory = getwd(),
      outputfile = "lodQC",
      lower_limit = NA, upper_limit = NA,
      stop_if_error = FALSE,
      reprint_warnings = FALSE)
}
\arguments{
  \item{phenofile}{
    either a data frame containing the phenotype (and covariate)
    values, or the filename (including the extension) of a data
    file containing the same. For details on the required format
    of the phenotype file, see the section on File Format in the
    description of \code{\link{lod_GWAS}}.
}
  \item{pheno_name}{
    the name of the column in phenofile contain the phenotype
    values.
}
  \item{filedirectory}{
    the directory that contains the phenotype file
    and where the output file will be saved. Please note that R
    uses \emph{forward} slash (/) where Windows uses backslash
    (\\). The default setting is current R working directory.
}
  \item{outputfile}{
    the name for the output file.
}
  \item{lower_limit, upper_limit}{
    two numeric values specifying the lower and upper LOD of the
    assay. Defaults are \code{NA}, in which case \code{lod_QC} only
    checks for gaps between measured and censored values. 
}
  \item{stop_if_error}{
    logical; determines whether the function aborts or continues
    when it encounters errors in the dataset. Default is \code{FALSE}.
}
  \item{reprint_warnings}{
    logical; this argument is used by \code{\link{lod_GWAS}}
    and isn't relevant for users. Setting it to \code{TRUE} will
    cause certain errors to be reported via \code{\link{warning}}
    (in addition to the console and the log file). Default is
    \code{FALSE}.
}
}
\details{
  The user can specify values for the lower and upper LOD. The
  function will then compare the values in the column outsideLOD
  with the phenotype values, conditional on the user-specified
  LOD. For details on the required format of the phenotype file,
  see the section on File Format in the description of
  \code{\link{lod_GWAS}}.
  
  Also, \code{lod_QC} will check if there is a gap between the
  smallest/largest values within the LOD (i.e. truly measured
  values, where outsideLOD is \code{1}), and the censored values.
  If the censored values are far smaller/larger than
  smallest/largest measured value, \code{lod_QC} will print a
  warning. An example
  of such an erroneous coding of censored values is
  when the phenotype values below the lower LOD have been set
  to -9, while the measured values are >0.
}
\value{
  The function \code{lod_QC} returns an invisible \code{NULL}.
  The real output is a log file containing information on the
  distribution of the phenotype, and any problems it
  encountered. These warnings are also displayed in the R console.
}
\note{
  The function \code{lod_QC} only checks and reports. It does
  \emph{not} correct the phenotype or outsideLOD values.
  
  Also, the function assumes that there is a single lower and/or
  upper LOD. If multiple LODs are used in the file, the function
  may produce warnings when both censored and real values
  do not match the specified limits.  In that case it is up to
  the user to ensure the quality of the phenotype file.
}
\seealso{
  \code{\link{lod_GWAS}} for the complete GWAS function.
}
\examples{
phenos <- data.frame(FID = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10),
                     IID = c("female1", "male2", "male3", "female4", "female5",
                             "male6", "female7", "male8", "male9", "male10"),
                     sex = c(0, 1, 1, 0, 0, 1, 0, 1, 1, 1),
                     outcome1 = c(0.3, 0.5, 0.9, 0.7, 2, 2, 0.1, 1.1, 2, 0.7),
                     outsideLOD = as.integer(c(1, 1, 1, 1, 1, 0, 2, 1, 0, 1)),
                     stringsAsfactors = FALSE)

lod_QC(phenofile = phenos, pheno_name = "outcome1",
       outputfile = "Sample_QC", lower_limit = 0.1, upper_limit = 2)
}