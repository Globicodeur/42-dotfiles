#!/usr/bin/env bash

make_on_change() {
  setopt null_glob
  files=(**/*.c **/*.h **/*.hpp **/*.cpp)
  echo "Monitoring: $files" | tr ' ' '\n'
  fswatch -l 0.1 -o $files | xargs -n1 -I _ sh -c "clear; make && echo 'OK'"
}
