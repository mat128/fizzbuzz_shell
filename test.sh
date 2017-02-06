#!/bin/bash -eux

test_subject="${TEST_SUBJECT:-"./fizzbuzz.sh"}"
answers_file="${ANSWERS_FILE:-"answers.txt"}"

actual_results_file=$(mktemp "${TMPDIR:-"/tmp/"}/fizzbuzz_test.XXXXXXXX")
trap "rm -f $actual_results_file" EXIT

$test_subject > $actual_results_file

diff $actual_results_file $answers_file && echo "Success, all answers match."
