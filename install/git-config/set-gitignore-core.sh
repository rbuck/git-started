#!/bin/bash

GLOBAL_GITIGNORE=~/.gitignore

# generic files to ignore
echo "*~" >> $GLOBAL_GITIGNORE
echo "*.out" >> $GLOBAL_GITIGNORE
echo "*.swp" >> $GLOBAL_GITIGNORE
echo "*.lock" >> $GLOBAL_GITIGNORE

# Mac OS X files to ignore
echo ".DS_Store" >> $GLOBAL_GITIGNORE

git config --global core.excludesfile ~/.gitignore

