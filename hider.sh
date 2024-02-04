#!/bin/bash

ls -1 $(pwd) | grep -v hider.sh | while read line; do
  mv "$line" ".$line"
done

rm -rf $0