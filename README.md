### DokuWiki Containerized

This is an containerized version of [DokuWiki](https://www.dokuwiki.org/dokuwiki) on top of [TrafeX/docker-php-nginx](https://github.com/TrafeX/docker-php-nginx)

#### Prerequisites
You will need to install `docker` and `docker-compose`

#### Setup
- Before you start the image for the first time, run the bash script `first-start.sh` to download the latest version of DokuWiki and set the appropriate permissions. 

- To start the service run `docker-compose up -d`

- Visit [http://machineip/install.php](http://localhost/install.php) to setup your instance of DokuWiki

If you need any assistance to upgrade, maintain etc. see the [DokuWiki](https://www.dokuwiki.org/dokuwiki) documentation
