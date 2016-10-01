#!/bin/sh

fswatch -0 -o TestSketch/TestSketch.pde | xargs -0 -n1 ./syncafterwatch.sh
