#!/usr/bin/expect -f
set password test
set source_path [lindex $argv 1]
set target_path [lindex $argv 0]
spawn scp -P 22 "$source_path"  test@192.168.1.123:$target_path
set timeout 300
expect "test@192.168.1.123's password:"
set timeout 300
send "$password\r"
set timeout 300
send "exit\r"
expect eof
