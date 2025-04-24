#!/bin/bash

declare -A aliases=(
  ["up"]="docker-compose -f ~/Documents/Repositories/DevRoom/docker-compose.yml up -d"
  ["down"]="docker-compose -f ~/Documents/Repositories/DevRoom/docker-compose.yml down"
  ["build"]="docker-compose -f ~/Documents/Repositories/DevRoom/docker-compose.yml build"
)

for name in "${!aliases[@]}"; do
  alias_cmd="alias $name='${aliases[$name]}'"

  if grep -Fxq "$alias_cmd" ~/.bashrc; then
    echo "Alias '$name' already exists in ~/.bashrc"
  else
    echo -e "\n$alias_cmd" >> ~/.bashrc
    echo "Alias '$name' added to ~/.bashrc"
  fi
done

source ~/.bashrc
