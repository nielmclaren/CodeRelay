#!/bin/sh

#set -x

sketch_name="TestSketch"
test_cmd="processing-java --sketch=`pwd`/$sketch_name --build"
start_cmd="processing-java --sketch=`pwd`/$sketch_name --present"

if [[ $(eval "$test_cmd") != *Finished* ]]; then
  exit
fi

# Get process IDs for previous sketch.
sketch_pids=`ps | grep -i "processing.* --sketch.*/$sketch_name" | grep -v grep | awk '
{
  if ($1!="") {
    print $1
  }
}'`

# Start new sketch.
eval "$start_cmd &"

sleep 5

# Kill previous sketch.
echo "$sketch_pids" | while read -r pid ; do
  if [[ $pid -ne "" ]]; then
    echo "Killing $pid"
    eval "kill $pid"
  fi
done

