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

echo "Moving files..."
mkdir wiki-data
cd dokuwiki*
mv -u --backup ./* ../wiki-data
cd ..

echo "Setting permissions..."
chmod 700 -R wiki-data/
sudo chown nobody:nobody -R wiki-data/

echo "Removing created files..."
rm -rf ./dokuwiki*

echo "You can start the service now with 'docker-compose up -d'."
