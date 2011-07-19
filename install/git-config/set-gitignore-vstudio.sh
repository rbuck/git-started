#!/bin/bash

# visual studio notes:
#  1. .sln files are xml that MUST be CRLF

# visual studio specific files to ignore

GLOBAL_GITIGNORE=~/.gitignore

echo "*.vcproj" >> $GLOBAL_GITIGNORE
echo "*.vcproj.*" >> $GLOBAL_GITIGNORE
echo "*.sdf" >> $GLOBAL_GITIGNORE
echo "*.opensdf" >> $GLOBAL_GITIGNORE
echo "*.vcxproj" >> $GLOBAL_GITIGNORE
echo "*.vcxproj.*" >> $GLOBAL_GITIGNORE
echo "*.eto" >> $GLOBAL_GITIGNORE
echo "*.dbmdl" >> $GLOBAL_GITIGNORE
echo "*.dbproj.user" >> $GLOBAL_GITIGNORE

echo "ipch/" >> $GLOBAL_GITIGNORE
echo "sql/" >> $GLOBAL_GITIGNORE

echo "Thumbs.db" >> $GLOBAL_GITIGNORE

echo "*.obj" >> $GLOBAL_GITIGNORE
echo "*.pdb" >> $GLOBAL_GITIGNORE
echo "*.user" >> $GLOBAL_GITIGNORE
echo "*.aps" >> $GLOBAL_GITIGNORE
echo "*.pch" >> $GLOBAL_GITIGNORE
echo "*.vspscc" >> $GLOBAL_GITIGNORE
echo "*.vssscc" >> $GLOBAL_GITIGNORE
echo "*_i.c" >> $GLOBAL_GITIGNORE
echo "*_p.c" >> $GLOBAL_GITIGNORE
echo "*.ncb" >> $GLOBAL_GITIGNORE
echo "*.suo" >> $GLOBAL_GITIGNORE
echo "*.tlb" >> $GLOBAL_GITIGNORE
echo "*.tlh" >> $GLOBAL_GITIGNORE
echo "*.bak" >> $GLOBAL_GITIGNORE
echo "*.cache" >> $GLOBAL_GITIGNORE
echo "*.ilk" >> $GLOBAL_GITIGNORE
echo "*.log" >> $GLOBAL_GITIGNORE
echo "*.lib" >> $GLOBAL_GITIGNORE
echo "*.sbr" >> $GLOBAL_GITIGNORE
echo "*.scc" >> $GLOBAL_GITIGNORE
echo "[Bb]in" >> $GLOBAL_GITIGNORE
echo "[Dd]ebug*/" >> $GLOBAL_GITIGNORE
echo "[Dd]eploy*/" >> $GLOBAL_GITIGNORE
echo "[Oo]bj/" >> $GLOBAL_GITIGNORE
echo "[Rr]elease*/" >> $GLOBAL_GITIGNORE
echo "_ReSharper*/" >> $GLOBAL_GITIGNORE
echo "[Tt]est[Rr]esult*" >> $GLOBAL_GITIGNORE
echo "[Bb]uild[Ll]og.*" >> $GLOBAL_GITIGNORE
echo "*.[Pp]ublish.xml" >> $GLOBAL_GITIGNORE
echo "BuildProcessTemplates/*" >> $GLOBAL_GITIGNORE
echo "Published/*" >> $GLOBAL_GITIGNORE
echo "[Tt]humbs.db" >> $GLOBAL_GITIGNORE
echo "[Uu]pgradeLog*.[Xx][Mm][Ll]" >> $GLOBAL_GITIGNORE
echo "_[Uu]pgradeReport_Files*/" >> $GLOBAL_GITIGNORE
echo "*.build.csdef" >> $GLOBAL_GITIGNORE
echo "[Pp]ackage/*" >> $GLOBAL_GITIGNORE
echo "ASPNETDB.MDF" >> $GLOBAL_GITIGNORE
echo "aspnetdb_log.ldf" >> $GLOBAL_GITIGNORE

