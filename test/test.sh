#!/bin/bash

VAR_NAME_DEF="TEST project 021"

#VAR_NAME_DEL=$(echo "${VAR_NAME_DEF}" | sed -e 's/[a-zA-Z0-9]*/\1/g')
#VAR_NAME_DEL=grep -Eo '[0-9]+' << ${VAR_NAME_DEF}

#echo ${VAR_NAME_DEL}

#testing=$(echo "${VAR_NAME_DEF}" | grep -E -o "[a-zA-Z0-9]*")

VAR_NAME_VAL=$( array=( $(echo "${VAR_NAME_DEF}" | grep -E -o "[a-zA-Z0-9]*") ); IFS=''; echo "${array[*]}" )
VAR_NAME_LOW=$( echo "${VAR_NAME_VAL}" | tr '[:upper:]' '[:lower:]')
VAR_NAME_FRT_UP="${VAR_NAME_LOW^}"
echo ${VAR_NAME_FRT_UP}
#var2=$(echo "${testing}" | sed -e 's/ //g')
#echo $var2


if [ -z ${IS_MODIF_NAME} ]
then
    IS_MODIF_NAME="YES"
fi

if [ "${IS_MODIF_NAME}" == "YES" ]
then
  echo "valide"
fi