# endecrypt

#### Version: 0.1.0

### Encrypt and Decrypt your data

`endecrypt` is an R package for encrypting and decrypting vectors, cells, lists, columns and data frames.

### Installation

```r
devtools::install_github("RevanthNemani/endecrypt")
```

### Usage

The package has the following functions 

* `SaveGenKey()`
* `LoadKey()`
* `Encrypt()`
* `Decrypt()`
* `EncryptCol()`
* `DecryptCol()`
* `EncryptDf()`
* `DecryptDf()`

Below is a minimal reproducable example of how to use this package.

```r
library(endecrypt)

# Generate and Save RSA key pair
# Warning: Use it only once for a project. Generating a new key pair will result in your data 
# loss if already encrypted and your private key was not stored safely.
SaveGenKey(bits = 2048,
              private.key.path = "Encription/private.pem",
              public.key.path = "Encription/public.pem")
              
# Load keys already stored using this function 
LoadKey("Encription/private.pem", Private)

# Encrypt single values
encv <- Encrypt(x = "abc", pub.key = pubkey, encryption.type = "aes256")

# Decrypt the encrypted values
Decrypt(x = encv, prv.key = prvkey, encryption.type = "aes256")

# Encrypt columns or list
encol <- EncryptCol(x = airquality$Ozone, pub.key = pubkey, encryption.type = "aes256")

# Decrypt the encrypted columns or lists
DecryptCol(x = encol, prv.key = prvkey, encryption.type = "aes256")

# Encrypt a data.frame
encdf <- EncryptDf(x = airquality, pub.key = pubkey, encryption.type = "aes256")

# Decrypt the encrypted data.frame
DecryptDf(x = encdf, prv.key = prvkey, encryption.type = "aes256")

```

### Disclaimer

We are not security professionals but have found these functions useful in our day to day projects and we would like to share it with the world.


#### Authors

Revanth Nemani <raynemani@gmail.com>

Aditya Vikram <adyviky9@gmail.com>

July 2019
