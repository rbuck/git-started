#!/bin/bash

# eclipse specific files to ignore

GLOBAL_GITIGNORE=~/.gitignore

echo "*.iml" >> $GLOBAL_GITIGNORE
echo "*.ipr" >> $GLOBAL_GITIGNORE
echo "*.iws" >> $GLOBAL_GITIGNORE
echo ".idea/" >> $GLOBAL_GITIGNORE
echo "local.properties" >> $GLOBAL_GITIGNORE
