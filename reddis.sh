#!/bin/bash

source common.sh

CHECK_ROOT

CREATE_LOG

COLORS


yum install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y &>>$LOGFILE

VALIDATE $? "Installing Redis repo"

yum module enable redis:remi-6.2 -y &>>$LOGFILE

VALIDATE $? "Enabling Redis 6.2"

yum install redis -y &>>$LOGFILE

VALIDATE $? "Installing Redis 6.2"

sed -i 's/127.0.0.1/0.0.0.0/g' /etc/redis.conf /etc/redis/redis.conf &>>$LOGFILE

VALIDATE $? "Allowing Remote connections to redis"

systemctl enable redis &>>$LOGFILE

VALIDATE $? "Enabling Redis"

systemctl start redis &>>$LOGFILE

VALIDATE $? "Starting Redis"