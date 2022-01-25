#!/bin/bash

APP=$1;

if [ $# -lt 1 ] ; then
   echo "App container value needed"
exit 1
fi;
if [[ $APP == "app01" ]]; then
  docker exec -it $APP /bin/bash
elif [[ $APP == "app02" ]]; then
  docker exec -it $APP /bin/bash
else
  echo "Please enter a valid app container"
fi;