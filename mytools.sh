#!/bin/bash

if [ $1 == "-h" ]
then
  while getopts ":h" opt; do
    case $opt in
      h)
        echo "" >&2
        echo "    Example Usage:" >&2
        echo "        ./mytools.sh /var/log/nameFile.log" >&2
        echo "        ./mytools.sh /var/log/nameFile.log -t json" >&2
        echo "        ./mytools.sh /var/log/nameFile.log -t text" >&2
        echo "        ./mytools.sh /var/log/nameFile.log -o /User/johnmayer/Desktop/nginxlog.txt" >&2
        echo "        ./mytools.sh /var/log/nameFile.log -t json -o /User/johnmayer/Desktop/nginxlog.txt" >&2
        echo "" >&2
        echo "    Options:" >&2
        echo "        -t [json/text]      Select the option to convert the file" >&2
        echo "        -o [dir]            Choose where to put the output file" >&2
        echo "        -h                  An Instruction Manual" >&2
        echo "" >&2
        ;;
    esac
  done
else
  # initiate
  input=$1
  file_name="${input##*/}"
  file_extension="${file_name##*.}"
  file="${file_name%.*}"

  # get the file to this dir
  echo "get file log with name: $file_name"
  cp "$input" "$file".txt
  file_name=$file".txt"

  if [ $2 == "-t" ]
  then
    if [ $3 == "json" ]
    then
      echo "Convert file log to json"
      mv $file_name "$file".json
      file_name=$file".json"
    else
      echo "Convert file log to txt"
    fi
  elif [ $2 == "-o" ]
  then
    echo "Put file log to $3"
    mv $file_name $3
  fi
fi
