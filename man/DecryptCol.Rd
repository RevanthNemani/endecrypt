% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/column_endecrypt.R
\name{DecryptCol}
\alias{DecryptCol}
\title{Column decryption}
\usage{
DecryptCol(x, prv.key, encryption.type = "aes256")
}
\arguments{
\item{x}{List or Column.
The column to decrypt}

\item{prv.key}{Key Object.
The private key object.
Use the LoadKey function to load the private key and assign it}

\item{encryption.type}{Refer PKI.encrypt function.
The default is "aes256"}
}
\value{
Decrypted list or column
}
\description{
Column decryption
}
\examples{
\dontrun{
DecryptCol(
  x = airquality$Ozone,
  prv.key = prvkey,
  encryption.type = "aes256"
)
}

}
\author{
"Revanth Nemani <raynemani@gmail.com>"

"Aditya Vikram <adyviky9@gmail.com>"
}
