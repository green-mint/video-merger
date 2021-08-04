#!/bin/bash

find "$1" -type f -name "*.mp4" | sort | sed "s/ /\\\ /g" | sed "s/'/\\\'/g" | xargs -d'\n' -n 1 echo file > out.txt
ffmpeg -f concat -safe 0 -i out.txt -c copy "$2"
rm out.txt