#!/bin/bash
##Script to generate rsa keys
##password.txt contains the string using as password

#Generate private key 
openssl genrsa -aes256 -passout file:password.txt -out priv.pem
#Generate private key using private key 
openssl rsa -in priv.pem -passin file:password.txt -out public.pem -outform PEM -pubout
