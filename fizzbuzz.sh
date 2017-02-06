#!/bin/sh

is_divisible_by() {
  local value=$1  
  local dividor=$2

  echo "scale=10; $value/$dividor" | bc | grep -q '.0000000000$'
}

for i in $(seq 1 100); do
  if is_divisible_by $i $((3*5)); then
    echo "FizzBuzz"
  elif is_divisible_by $i 3; then
    echo "Fizz"
  elif is_divisible_by $i 5; then
    echo "Buzz"
  else
    echo $i
  fi
done
