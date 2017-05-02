#!/bin/bash

DOKUWIKI="openag-wiki"

# Copy recommended file
rsync -av \
  --exclude 'cache'\
  --exclude 'index'\
  --exclude 'locks'\
  --exclude 'tmp'\
  $DOKUWIKI:/var/www/html/data/ ./DokuWiki/data

rsync -av openag-wiki:/var/www/html/conf/ DokuWiki/conf
rsync -av openag-wiki:/var/www/html/lib/plugins/ DokuWiki/lib/plugins

# Create empty dirs for docker
mkdir -p ./DokuWiki/data/tmp
mkdir -p ./DokuWiki/data/index
mkdir -p ./DokuWiki/data/locks
mkdir -p ./DokuWiki/data/cache
