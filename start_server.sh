#!/bin/bash

docker run -itd -p 80:80 --name dev_wiki \
  -v $(pwd)/DokuWiki/data:/dokuwiki/data \
  -v $(pwd)/openag:/dokuwiki/lib/tpl/openag \
  -v $(pwd)/DokuWiki/lib/plugins:/dokuwiki/lib/plugins \
  -v $(pwd)/openag:/dokuwiki/lib/tpl/openag \
  -v $(pwd)/DokuWiki/conf:/dokuwiki/conf \
  mprasil/dokuwiki:2016-06-26a
