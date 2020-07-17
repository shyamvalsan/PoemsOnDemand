#!/bin/bash
x=1
while [ $x -le $1 ]
do
  random_poetry_scraper --num-poems=1 --json > poems.json
  jq '.poems[0] | .text' poems.json > poems.csv
  cat poems.csv | awk '{gsub(/\\n/,"\n")}1' >> poems_final.csv
  echo "\n\n<!endoftext!>\n\n" >> poems_final.csv  
  x=$(( $x + 1 ))
done
rm poems.json
rm poems.csv
