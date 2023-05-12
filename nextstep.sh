#!/bin/bash
# Takes a file name as an argument, and reads the value of the key "nextstep.state" from that file.
shopt -s expand_aliases
source ~/.bashrc

# Read key from file
current_state=$(cat nextstep.state)

# Read value from file by key
next_step=$(cat $1 | grep "${current_state}=" | cut -d'=' -f2)

# Evaluate next steps
eval "$next_step"

# Read next state from file by key_next
next_state=$(cat $1 | grep "${current_state}_next=" | cut -d'=' -f2)

# Write next state to file
echo "$next_state" > nextstep.state


