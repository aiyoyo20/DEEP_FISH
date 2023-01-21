#!/bin/bash
# Author: aiyoyo
# last modified : 2023-01-20 15:14:09
# last modified : 2023-01-19 21:40:27

findAttachment(){
    find . -name images -exec cp -r {} "${1}" \;
}

imageFilter(){
    find "${1}" -name "*md" | xargs cat | sed -n  's/.*images\/\(.*png\).*/\1/p' | sort > used.txt
    find "${1}" -name images | xargs ls -l | grep -E "rw" | tr -s " " | cut -d " " -f 9 | sort| grep -E "png|gif|webp" > owned.txt
}
