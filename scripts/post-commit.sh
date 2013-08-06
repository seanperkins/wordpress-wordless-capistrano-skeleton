#!/bin/sh
#
# Removes compiled Wordless files so they don't get in the way of development.
#

rm ./application/content/themes/%%THEME_NAME%%/assets/stylesheets/screen.css
rm ./application/wp-content/themes/%%THEME_NAME%%/assets/javascripts/application.js