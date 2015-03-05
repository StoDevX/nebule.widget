#!/usr/local/bin/fish

set room $argv[1]
printf "{"
set machine_count 21
for machine in (seq 1 $machine_count)
  printf "\"$machine\":"
  ping -o -q rns$room-$machine.cs.stolaf.edu ^/dev/null >/dev/null
  if test $status -eq 0
    printf "true"
  else
    printf "false"
  end
  if test $machine -lt $machine_count
    # because json is invalid with trailing commas
    printf ","
  end
end

printf "}"
