#!/bin/bash

user="arduino"
token="7f97fa897b3beaa0c1edbdee6742b6ba"
jenkinsurl="206.87.37.167:8080"

curl "http://${user}:${token}@${jenkinsurl}/pluginManager/api/xml?depth=1&xpath=/*/*/shortName|/*/*/version&wrapper=plugins" | perl -pe 's/.*?<shortName>([\w-]+).*?<version>([^<]+)()(<\/\w+>)+/\1:\2\n/g' | tee plugins.txt | tail

printf "\nDone. Tail of output shown, full list written to plugins.txt\n"
