#!/bin/bash 
#set -e

set  -o nounset

#pushd `dirname $0`>/dev/null
#dir_self=`where_am_i $0`
dir_self=`pwd`
#pushd "$dir_self">/dev/null

#echo "$@" >> $log_wrapper.txt
################################## start
#num="${1:-1}"
#notify-send "croning choose:" " $num"
#sleep "$num"
#########################################
step(){
    str=$1
    print_color 34 "\t\t\t\t [ $count_step ] $str  "
    eval "$str" 
    let 'count_step += 1'
}
steps(){
    #    eval reset_log
    ################am I root?
    step set_user

    ################set global vars / list.txt can use it
    step    exports

    ################ load cron's env dump
    step drop_env

    ################ show error generated by the cron service
    step  run 
}

export choose=${1:-0}
#exec 2>/tmp/err
#trap trap_err ERR
set -o nounset
#clear
count_step=0
#type steps | grep step | sed 's/step//g' | sed 's/;//g'
echo  "[RUNNING]"
source "$dir_self/setup.cfg"
eval steps
#popd>/dev/null
#cat -n list.txt
