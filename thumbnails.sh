#!/bin/bash
#


WIDTH=320
HEIGHT=180
for i in $@
do
  # Stores the width of the current file
  path=$(dirname $i)
  filename=$(basename $i)
  name="${filename%.*}"
  ext="${filename##*.}"

  iwidth=`identify -format "%w" $i`
  # Checks current filename does not end with '-thumb' and
  # file is greater than desired width
  if [[ $i != *-thumb* ]] #&& [ $iwidth -gt $HEIGHT ]
  then
    
    magick $i -auto-orient -thumbnail "${WIDTH}x${HEIGHT}>" -background transparent -gravity center -extent ${WIDTH}x${HEIGHT} "$path/$name-thumb.$ext"
    echo $i
  fi
done
