#!/bin/bash

# Checking parameters
if [ $# -ne 2 ]; then
    echo "Error: Exactly 2 parameters are required!" >&2
    exit 1
fi
