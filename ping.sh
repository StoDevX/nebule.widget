#!/bin/bash

building=$1
room=$2
machine_count=$3

printf "{"

for machine in $(seq 1 "$machine_count"); do
  printf "\"%s\":" "$machine"
  ping -o -q -t 1 "$building""$room"-"$machine".cs.stolaf.edu 1>/dev/null 2>/dev/null
  if test "$?" -eq 0; then
    printf "true"
  else
    printf "false"
  fi
  if test "$machine" -lt "$machine_count"; then
    # because json is invalid with trailing commas
    printf ","
  fi
done

printf "}"
