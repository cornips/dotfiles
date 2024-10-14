#!/bin/sh

echo "Cloning repositories..."

DEVELOPMENT=$HOME/Development

# Personal
git clone git@github.com:cornips/react-base.git $DEVELOPMENT/cornips/react-base

# Flobro
git clone git@github.com:flobro/flobro-website.git $DEVELOPMENT/flobro/flobro-website
git clone git@github.com:flobro/flobro-chrome-app.git $DEVELOPMENT/flobro/flobro-chrome-app
git clone git@github.com:flobro/flobro-app.git $DEVELOPMENT/flobro/flobro-app

# Clients
git clone git@bitbucket.org:cornips/heldro-verkoop.git $DEVELOPMENT/heldro-verkoop
git clone git@gitlab.com:EDSN/gopacs/platform.git $DEVELOPMENT/gopacs/platform
git clone git@gitlab.com:EDSN/gopacs/frontend.git $DEVELOPMENT/gopacs/frontend
