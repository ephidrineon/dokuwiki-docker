#!/bin/bash


echo "Downloading DokuWiki:stable..."
if ! wget https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz &> /dev/null
then
    echo "wget not found trying curl..."
    if ! (curl https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz > dokuwiki-stable.tgz) &> /dev/null
    then
        echo "curl and wget not found, aborting..."
        exit
    fi
fi

echo "Unpacking..."
tar -xzvf dokuwiki-stable.tgz &> /dev/null
rm -f dokuwiki-stable.tgz

echo "Moving Files..."
mkdir wiki_data
cd dokuwiki*
mv -u --backup ./* ../wiki_data
cd ..

echo "Setting Permissions..."
chmod 700 -R wiki_data/
sudo chown nobody.nobody -R wiki_data/

echo "Removing created Files..."
rm -rf ./dokuwiki*

echo "You can start the services now with 'docker-compose up -d'."
