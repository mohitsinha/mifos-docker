#!/bin/bash

keytool -genkey -noprompt -storepass password -keypass password -keyalg RSA -alias tomcat  -keystore /usr/local/tomcat.keystore -dname "CN=test, OU=ID, O=test, L=test, ST=test, C=ID"
catalina.sh run

