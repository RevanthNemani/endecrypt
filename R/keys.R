#' Saves generated keys
#'
#' @param bits Number. Usually 2048
#' @param private.key.path path to save the private key.
#' It should have a file extension ".pem" or ".der"
#' @param public.key.path  path to save the public key.
#' It should have a file extension ".pem" or ".der"
#'
#' @author "Revanth Nemani <raynemani@gmail.com>"
#' @author "Aditya Vikram <adyviky9@gmail.com>"
#'
#' @import PKI
#'
#' @return Saves public and private keys in specified paths
#'
#' @examples
#' \dontrun{
#' SaveGenKey(
#'   bits = 2048,
#'   private.key.path = "Encription/private.pem",
#'   public.key.path = "Encription/public.pem"
#' )
#' }
#'
#' @export
SaveGenKey <- function(bits = 2048, private.key.path, public.key.path) {
  # Generates and saves public and private keys in the given paths
  #
  # Args:
  #  bits: Number usually 2048
  #  private.key.path: path to save the private key.
  #                    It should have a file extension ".pem" or ".der"
  #  public.key.path: path to save the public key.
  #                   It should have a file extension ".pem" or ".der"
  key <- PKI::PKI.genRSAkey(bits)
  PKI::PKI.save.key(key,
    format = c("PEM", "DER"),
    private = T, target = private.key.path
  )
  PKI::PKI.save.key(key,
    format = c("PEM", "DER"),
    private = F, target = public.key.path
  )
}

## Uncommit and run the below function to generate and save a new key pair.
## Warning: use it only once for every client.
# SaveGenKey(bits = 2048,
#              private.key.path = "Encription/private.pem",
#              public.key.path = "Encription/public.pem")


#' loads the generated keys
#'
#' @param key.path Specify the path of the key in "".
#' The file extensions should end in ".pem" or ".der"
#' @param Private  Boolean.
#' If the key is a private key use TRUE.
#' If the key is public key use FALSE.
#'
#' @author "Revanth Nemani <raynemani@gmail.com>"
#' @author "Aditya Vikram <adyviky9@gmail.com>"
#'
#' @import PKI
#'
#' @return Loads public and private keys from specific paths
#'
#' @examples
#' \dontrun{
#' LoadKey("Encription/private.pem", Private)
#' }
#'
#' @export
LoadKey <- function(key.path, Private) {
  # loads the keys given by the user.
  #
  # Args:
  #  key.path: Specify the path of the key in "".
  #            The file extensions should end in ".pem" or ".der"
  #  Private: (Boolean).
  #           If the key is a private key use TRUE.
  #           If the key is public key use FALSE.
  k <- PKI::PKI.load.key(
    format = c("PEM", "DER"),
    private = Private, file = key.path
  )
  return(k)
}
