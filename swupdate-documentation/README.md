SWUpdate documentation

SWUpdate Steps to integrate with yocto

1. Install Yocto setup packages
 
      1_yocto_setup_script.sh

2.  Install Kas package 

      2_yocto_setup_script.sh

3. Create image recipe (.yml)

4. Create SWUpdate update image recipe # Based on Pierre-Jean GitHub: https://github.com/texierp/kas-files 

5. Build Image (kas build Device-Recipe.yml:swupdate-recipe.yml) #kas documentation ":" command reason : https://kas.readthedocs.io/en/latest/userguide.html#module-kas.plugins.dump

6. Generate Keys/Certificates with ssl for signing image (https://sbabic.github.io/swupdate/signed_images.html?highlight=rsa )

   6_generate-keys.sh

7 . Enable swupdate signing and define paths from Keys/Certificates/Passwords with The swupdate class(https://sbabic.github.io/swupdate/building-with-yocto.html?highlight=rsa#the-swupdate-class)

   Create script to replace the lines in the code with the paths
   
   7_enable-sig-paths.sh
   
   
8 . Replace swupdate config files with custom configuration: 
   
     swupdate.cfg      path: /meta-swupdate-boards/recipes-support/swupdate/swupdate/rpi
     defconfig         path: /meta-swupdate-boards/recipes-support/swupdate/swupdate/rpi
     09-swupdate-args  path: /meta-swupdate-boards/recipes-support/swupdate/swupdate/rpi
     raspberrypi4.wks  path: /meta-swupdate-boards/wic 
     sw-description    path: /meta-swupdate-boards/recipes-extended/images/update-image/rpi
     emmcsetup.lua     path: /meta-swupdate-boards/recipes-extended/images/update-image/rpi
     
     Custom_config_swupdate.sh
9 . Rebuild image (kas build Device-Recipe.yml:swupdate-recipe.yml)

10 . Flash the file ".gz" and ".swu" is the update package

#SWUpdate Service

 The right execution of SWupdate is as a service 


Errors:
No match for argument: build-essential
1_yocto-setup.sh: line 7: cmake: command not found
1_yocto-setup.sh: line 8: chrpath: command not found

#Keys Generation
 #url: https://sbabic.github.io/swupdate/signed_images.html#generating-private-and-public-key
Tool to generate keys / certificates

For RSA and CMS signing, the openssl tool is used to generate the keys. This is part of the OpenSSL project. A complete documentation can be found at the openSSL Website.

For GPG, gpg can be used to generate the keys and to sign the images. A complete documentation can be found at the GnuPG Website.


Generating private and public key

First, the private key must be created:

openssl genrsa -aes256 -out priv.pem

This asks for a passphrase. It is possible to retrieve the passphrase from a file - of course, this must be protected against intrusion.

openssl genrsa -aes256 -passout file:passout -out priv.pem

The private key is used to export the public key with:

openssl rsa -in priv.pem -out public.pem -outform PEM -pubout

“public.pem” contains the key in a format suitable for swupdate. The file can be passed to swupdate at the command line with the -k parameter.


How to sign with RSA

Signing the image with rsa-pkcs#1.5 is very simple:

openssl dgst -sha256 -sign priv.pem sw-description > sw-description.sig

Signing the image with rsa-pss is also very simple:

openssl dgst -sha256 -sign priv.pem -sigopt rsa_padding_mode:pss \
    -sigopt rsa_pss_saltlen:-2 sw-description > sw-description.sig

#The swupdate class
url: https://sbabic.github.io/swupdate/building-with-yocto.html?highlight=rsa#the-swupdate-class

In the file " "





