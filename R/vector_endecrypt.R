#' Encrypt variable
#'
#' @param x The variable to be encrypted
#' @param pub.key key object.
#' The public key object.
#' Use the LoadKey funtion to load the public key and assign it
#' @param encryption.type Refer PKI.encrypt function. The default is "aes256"
#'
#' @author "Revanth Nemani <raynemani@gmail.com>"
#' @author "Aditya Vikram <adyviky9@gmail.com>"
#'
#' @import PKI
#'
#' @return Encrypted variable
#'
#' @examples
#' \dontrun{
#' Encrypt(x = "abc", pub.key = pubkey, encryption.type = "aes256")
#' }
#'
#' @export
Encrypt <- function(x, pub.key, encryption.type = "aes256") {
  # function assumes you already created a RSA key
  # encrypts a vector
  # pki
  # Args:
  #  x: The vector(variable) to be encrypted.
  #  pub.key: The public key object.
  #           Use the LoadKey() to load the public key and assign it.
  #  encryption.type: Refer PKI.encrypt(). The default is "aes256".
  x <- charToRaw(as.character(x))
  e <- PKI::PKI.encrypt(x, pub.key, encryption.type)
  return(e)
}

#' Decrypt variable
#'
#' @param x The variable to be decrypted
#' @param prv.key key object.
#' The private key object.
#' Use the LoadKey funtion to load the private key and assign it
#' @param encryption.type Refer PKI.encrypt function. The default is "aes256"
#'
#' @author "Revanth Nemani <raynemani@gmail.com>"
#' @author "Aditya Vikram <adyviky9@gmail.com>"
#'
#' @import PKI
#'
#' @return Encrypted variable
#'
#' @examples
#' \dontrun{
#' Decrypt(x = Encrypted_object, prv.key = prvkey, encryption.type = "aes256")
#' }
#'
#' @export
Decrypt <- function(x, prv.key, encryption.type = "aes256") {
  # function assumes you already have a key
  # decrypts an encrypted vector
  #
  # Args:
  #  x: The encrypted vector(variable) to be decrypted.
  #  prv.key: The private key object.
  #           Use the LoadKey() to load the private key and assign it.
  #  encryption.type: Refer PKI.encrypt(). The default is "aes256".
  e <- PKI::PKI.decrypt(x, prv.key, encryption.type)
  x <- rawToChar(e)
  return(x)
}
