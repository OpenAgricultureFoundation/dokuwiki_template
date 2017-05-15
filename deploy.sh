#!/bin/bash

set -e

mv config ~/.ssh/
rsync -o StrictHostKeyChecking=no openag/* openag-wiki:/var/www/html/lib/tpl/openag/
