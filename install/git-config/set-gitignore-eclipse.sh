#!/bin/bash

# eclipse specific files to ignore

GLOBAL_GITIGNORE=~/.gitignore

echo ".classpath" >> $GLOBAL_GITIGNORE
echo ".project" >> $GLOBAL_GITIGNORE
echo ".settings" >> $GLOBAL_GITIGNORE

