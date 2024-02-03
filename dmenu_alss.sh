#!/bin/sh 
# default alias file is .bashrc
# but you can pass yours
alias_file=~/.bashrc
if [[ $1 != "" ]]; then
  alias_file=$1
fi

inp_aliases=$(cat $alias_file | grep alias)
# aliases names parsing
pre_aliases=$(echo "$inp_aliases" | 
while read n; 
do 
  echo ${n#"alias "}
done)

aliases=$(echo "$pre_aliases" |
while read n;
do
  echo ${n%%=*}
done)
# dmenu execution
cmd=$( ( echo "$aliases"; cat ~/.cache/dmenu_run ) | dmenu)


parse_cmd () {
  str1=$(echo "$pre_aliases" | grep $1)
  str2=${str1#$1"="}
  if [[ ${str2::1} == "'" ]]; then
    str3=${str2#"'"}
    str4=${str3%"'"}
  fi
  # if alias was written within " " 
  if [[ ${str2::1} == "\"" ]]; then
    str3=${str2#"\""}
    str4=${str3%"\""}
  fi 
  eval "$str4"
}


while read n;
do
  if [[ "$cmd" == $n ]]; then
    newcmd=$(parse_cmd $cmd)
    echo $newcmd | bash 
    break
  else
    echo $cmd | bash
  fi
done <<<$(echo "$aliases")
