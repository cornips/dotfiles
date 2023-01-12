#!/bin/sh

echo "Generating a new SSH key for GitHub/GitLab/Bitbucket..."

# Generating a new SSH key
# https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key
ssh-keygen -t rsa -C $1 -f ~/.ssh/id_rsa

# Adding your SSH key to the ssh-agent
# https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#adding-your-ssh-key-to-the-ssh-agent
eval "$(ssh-agent -s)"

touch ~/.ssh/config
echo "Host server1.cornipshosting.nl\n Port 61619\n\nHost *\n AddKeysToAgent yes\n UseKeychain yes\n IdentityFile ~/.ssh/id_rsa\n\n# Fig ssh integration. Keep at the bottom of this file.\nMatch all\n  Include ~/.fig/ssh" | tee ~/.ssh/config

ssh-add -K ~/.ssh/id_rsa

# Adding your SSH key to your GitHub account
# https://docs.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account
echo "run 'pbcopy < ~/.ssh/id_rsa.pub' and paste that into GitHub/GitLab/Bitbucket"
