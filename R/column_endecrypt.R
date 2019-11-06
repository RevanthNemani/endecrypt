#' Column encryption
#'
#' @param x List or Column. The column to encrypt
#' @param pub.key Key Object. The public key object.
#' Use the LoadKey function to load the public key and assign it
#' @param encryption.type Refer PKI.encrypt function. The default is "aes256"
#'
#'
#' @author "Revanth Nemani <raynemani@gmail.com>"
#' @author "Aditya Vikram <adyviky9@gmail.com>"
#'
#' @import PKI
#' @import parallel
#'
#' @return Encrypted list or column
#'
#' @examples
#' \dontrun{
#' EncryptCol(
#'   x = airquality$Ozone,
#'   pub.key = pubkey,
#'   encryption.type = "aes256"
#' )
#' }
#'
#' @export
EncryptCol <- function(x, pub.key, encryption.type = "aes256") {
  # Encrypts a column.
  # For best result assign it to the same column in the dataset.
  #
  # Args:
  #  x: The column to encrypt.
  #  pub.key: The public key object.
  #           Use the LoadKey() to load the public key and assign it.
  #  encryption.type: Refer PKI.encrypt(). The default is "aes256".
  b <- encryption.type
  e.p <- function(x) {
    # function assumes you already created a RSA key
    Encrypt(x = x, pub.key = pub.key, encryption.type = b)
  }
  a <- parallel::mcMap(e.p, x)
  return(a)
}

#' Column decryption
#'
#' @param x List or Column.
#' The column to decrypt
#' @param prv.key Key Object.
#' The private key object.
#' Use the LoadKey function to load the private key and assign it
#' @param encryption.type Refer PKI.encrypt function.
#' The default is "aes256"
#'
#'
#' @author "Revanth Nemani <raynemani@gmail.com>"
#' @author "Aditya Vikram <adyviky9@gmail.com>"
#'
#' @import PKI
#' @import parallel
#'
#' @return Decrypted list or column
#'
#' @examples
#' \dontrun{
#' DecryptCol(
#'   x = airquality$Ozone,
#'   prv.key = prvkey,
#'   encryption.type = "aes256"
#' )
#' }
#'
#' @export
DecryptCol <- function(x, prv.key,
                       encryption.type = "aes256") {
  # decrypts an encrypted column.
  #
  # Args:
  #  x: The encrypted column to be decrypted.
  #  prv.key: The private key object.
  #           Use the LoadKey() to load the private key and assign it.
  #  encryption.type: Refer PKI.encrypt(). The default is "aes256".
  b <- encryption.type
  d.p <- function(x) {
    # function assumes you already created a RSA key
    Decrypt(x = x, prv.key = prv.key, encryption.type = b)
  }
  a <- unlist(parallel::mcMap(d.p, x))
  return(a)
}
