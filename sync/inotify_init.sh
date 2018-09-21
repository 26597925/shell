#!/bin/sh
SRC=/alidata/www/manage/upload/
 #记得在最后面加/不然RYNC会自动增加一层目录
  
DES=web1
IP=114.215.140.111
USER=rsync
#DST=/etc/rsyncd 远程rsync模块下的目录
INWT=/usr/bin/inotifywait
RSYNC=/usr/bin/rsync
  
$RSYNC -zahqt --password-file=/root/rsync.pwd $SRC $USER@$IP::$DES
