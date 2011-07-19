#!/bin/bash

# java specific files to ignore

GLOBAL_GITIGNORE=~/.gitignore

echo "*.class" >> $GLOBAL_GITIGNORE
echo "*.clover" >> $GLOBAL_GITIGNORE

