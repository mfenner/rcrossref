% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/cr_cn.r
\name{cr_cn}
\alias{cr_cn}
\title{Get citations in various formats from CrossRef.}
\usage{
cr_cn(dois, format = "text", style = "apa", locale = "en-US",
  .progress = "none", ...)
}
\arguments{
\item{dois}{Search by a single DOI or many DOIs.}

\item{format}{Name of the format. One of "rdf-xml", "turtle", "citeproc-json", "text",
"ris", "bibtex", "crossref-xml", "datacite-xml","bibentry", or "crossref-tdm"}

\item{style}{a CSL style (for text format only). See \code{\link{get_styles}}
for options. Default: apa. If there's a style that CrossRef doesn't support you'll get a
\code{(500) Internal Server Error}}

\item{locale}{Language locale. See \code{?Sys.getlocale}}

\item{.progress}{Show a \code{plyr}-style progress bar? Options are "none", "text", "tk", "win,
and "time".  See \code{\link[plyr]{create_progress_bar}} for details of each.}

\item{...}{Named parameters passed on to \code{\link[httr]{GET}}}
}
\description{
Get citations in various formats from CrossRef.
}
\details{
See \url{http://www.crosscite.org/cn/} for more info on the
  	Crossref Content Negotiation API service.
}
\examples{
\donttest{
cr_cn(dois="10.1126/science.169.3946.635")
}

\dontrun{
cr_cn(dois="10.1126/science.169.3946.635", format="citeproc-json")
cr_cn("10.1126/science.169.3946.635", "rdf-xml")
cr_cn("10.1126/science.169.3946.635", "crossref-xml")
cr_cn("10.1126/science.169.3946.635", "bibtex")

# return an R bibentry type
cr_cn("10.1126/science.169.3946.635", "bibentry")
cr_cn("10.6084/m9.figshare.97218", "bibentry")

# return an apa style citation
cr_cn("10.1126/science.169.3946.635", "text", "apa")
cr_cn("10.1126/science.169.3946.635", "text", "harvard3")
cr_cn("10.1126/science.169.3946.635", "text", "elsevier-harvard")
cr_cn("10.1126/science.169.3946.635", "text", "ecoscience")
cr_cn("10.1126/science.169.3946.635", "text", "heredity")
cr_cn("10.1126/science.169.3946.635", "text", "oikos")

# example with many DOIs
dois <- cr_r(2)
cr_cn(dois, "text", "apa")

# Cycle through random styles - print style on each try
stys <- get_styles()
foo <- function(x){
 cat(sprintf("<Style>:\%s\\n", x), sep = "\\n\\n")
 cr_cn("10.1126/science.169.3946.635", "text", style=x)
}
foo(sample(stys, 1))
}
}

