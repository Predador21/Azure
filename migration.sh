#!/bin/bash

while true
do

 sa=($(rclone listremotes))

 i=0

 while [ $i -lt ${#sa[@]} ]
 do

   account=${sa[i]}

   if [[ $account =~ "harvester" ]]
   then
      echo
      echo $account
      rclone copy dropbox:gdriveOk/ $account --transfers=7  --progress --drive-stop-on-upload-limit --drive-stop-on-download-limit
   fi

   ((i++))

 done

done
