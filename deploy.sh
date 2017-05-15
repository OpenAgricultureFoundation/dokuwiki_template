#!/bin/bash

set -e

mv config ~/.ssh/
rsync openag/* openag-wiki:/var/www/html/lib/tpl/openag/
