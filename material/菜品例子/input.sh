#!/bin/bash

id=0
u=","
v="'"

while read -a arr
do
    id=$[id+1]
    name=$v${arr[0]}$v
    description=$v${arr[1]}$v
    price=${arr[2]}
    likes=${arr[3]}
    tag=${arr[4]}
    amount=${arr[5]}
    rating=${arr[6]}
    picture=$v${arr[7]}$v
    if [ "$tag"=="饭菜" ];
    then
        tag_id=1
    fi
    if [ "$tag"=="水果" ];
    then
        tag_id=2
    fi
    if [ "$tag"=="饮品" ];
    then
        tag_id=3
    fi
    item='('$id$u$name$u$picture$u$price$u$description$u$rating$u$amount$u$likes$u$tag_id$')'
    str=$str$item$u
done

len=${#str}
len=$[len-1]
str=${str:0:len}
str="INSERT INTO \`food\` VALUES "$str";"
echo $str
