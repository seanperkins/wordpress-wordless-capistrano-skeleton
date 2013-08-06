#!/bin/sh
#
# Compiles SASS & CoffeeScript before commit.
# Requires Wordless, Sprockets, and Compass.
# To get these, 'sudo gem install wordless sprockets compass'
#
sudo chmod 775 ./application/wp-content/themes/moblab/tmp -R
cd ./application
wordless compile
cd ..
git add ./application/content/themes/%%THEME_NAME%%/assets/stylesheets
git add ./application/content/themes/%%THEME_NAME%%/assets/javascripts
