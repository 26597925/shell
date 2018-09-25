#!/bin/bash

MYSCRIPT=$2
TIME=$3

crontab -l > cron
number=`grep -n "$MYSCRIPT" cron | cut -d ":" -f 1`
aa=$number

addjob()
{
    if [ -z $aa ];
    then
    	echo "该任务不存在，将添加"
    	echo ''$TIME' '$MYSCRIPT'' >> cron
        sed -i 's/#/*/g' cron
    	crontab cron
    	rm -f cron
    else
    	echo "该任务已经存在，将会先删除再添加"
    	sed -i ''$aa' d' cron
    	echo ''$TIME' '$MYSCRIPT'' >> cron
        sed -i 's/#/*/g' cron
    	crontab cron
	rm -f cron
    fi
}

deljob()
{
    sed -i ''$aa' d' cron
    crontab cron
    rm -f cron
}

usage()
{
    echo "-a                    add job"
    echo "-d                    del job"
    echo "-h                    help "
    exit 1
}

while getopts "adh:" arg
do
    case $arg in
        a)
            addjob ;;
        d)
	    deljob ;;
        h)
            usage ;;
        ?)
            usage ;;
    esac
done
