#!/bin/sh -l

echo "Hello $1"
time=echo "Time is (date)"
echo "time=$time" >> $GITHUB_OUTPUT

