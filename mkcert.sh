#!/usr/bin/env zsh

# Clean up
KNOWN_MKCERT_CERTIFICATES=($(echo $(security find-certificate -a -c mkcert -Z /Library/Keychains/System.keychain | grep ^SHA-1 | sed -n 's/.*hash: \(.*\)/\1/p')))
# Disable any previous mkcert root CA certificates
if [ ! -z "$KNOWN_MKCERT_CERTIFICATES" ]; then
	mkcert -uninstall &> /dev/null
fi
# Remove them from keychain
for cert in $KNOWN_MKCERT_CERTIFICATES; do
	sudo security delete-certificate -Z $cert /Library/Keychains/System.keychain
done
# Remove files
rm -rf "$(mkcert -CAROOT)"

# Install root CA
mkcert -install
# Install certificate for localhost
mkcert -cert-file ~/Sites/localhost.pem -key-file ~/Sites/localhost-key.pem localhost 127.0.0.1 ::1
