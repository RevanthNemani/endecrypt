#' Data frame encryption
#'
#' @param x data.frame. The dataset to encrypt
#' @param pub.key  Key Object.
#' The public key object.
#' Use the LoadKey function to load the public key and assign it
#' @param encryption.type Refer PKI.encrypt function. The default is "aes256"
#' @author "Revanth Nemani <raynemani@gmail.com>"
#' @author "Aditya Vikram <adyviky9@gmail.com>"
#'
#' @import PKI
#' @import parallel
#'
#' @return Encrypted \code{data.frame}
#'
#' @examples
#' \dontrun{
#' EncryptDf(x = airquality, pub.key = pubkey, encryption.type = "aes256")
#' }
#'
#' @export
EncryptDf <- function(x, pub.key, encryption.type = "aes256") {
  # Encrypts a data frame.
  #
  # Args:
  #  x: The dataset to encrypt.
  #  pub.key: The public key object.
  #           Use the LoadKey() to load the public key and assign it.
  #  encryption.type: Refer PKI.encrypt(). The default is "aes256".
  d <- pub.key
  b <- encryption.type
  if (nrow(x) == 1) {
    x[2, ] <- NA
    e.col <- function(x) {
      EncryptCol(x, pub.key = pub.key, encryption.type = b)
    }
    y <- as.data.frame(sapply(x, e.col), stringsAsFactors = F)
    y <- y[1, ]
    rownames(y) <- NULL
    return(y)
  } else {
    e.col <- function(x) {
      EncryptCol(x, pub.key = pub.key, encryption.type = b)
    }
    y <- as.data.frame(sapply(x, e.col), stringsAsFactors = F)
    rownames(y) <- NULL
    return(y)
  }
}

#' Data frame decryption
#'
#' @param x encrypted data.frame. The dataset to decrypt
#' @param prv.key  Key Object.
#' The private key object.
#' Use the LoadKey function to load the private key and assign it
#' @param encryption.type Refer PKI.encrypt function. The default is "aes256"
#'
#' @author "Revanth Nemani <raynemani@gmail.com>"
#' @author "Aditya Vikram <adyviky9@gmail.com>"
#'
#' @import PKI
#' @import parallel
#' @import purrr
#'
#' @return Decrypted \code{data.frame}
#'
#' @examples
#' \dontrun{
#' DecryptDf(x = airquality, prv.key = prvkey, encryption.type = "aes256")
#' }
#'
#' @export
DecryptDf <- function(x, prv.key, encryption.type = "aes256") {
  # decrypts an encrypted dataset.
  #
  # Args:
  #  x: The encrypted dataset to be decrypted.
  #  prv.key: The private key object.
  #           Use the LoadKey() to load the private key and assign it.
  #  encryption.type: Refer PKI.encrypt(). The default is "aes256".
  d <- prv.key
  b <- encryption.type
  if (nrow(x) == 1) {
    rn <- colnames(x)
    d.col <- function(x) {
      DecryptCol(x = x, prv.key = prv.key, encryption.type = b)
    }
    y <- as.data.frame(sapply(x, d.col), stringsAsFactors = F)
    y <- as.data.frame(purrr::transpose(y))
    colnames(y) <- rn
    rownames(y) <- NULL
  } else {
    d.col <- function(x) {
      DecryptCol(x = x, prv.key = prv.key, encryption.type = b)
    }
    y <- as.data.frame(sapply(x, d.col), stringsAsFactors = F)
    rownames(y) <- NULL
  }
  return(y)
}
