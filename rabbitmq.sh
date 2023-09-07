#!/bin/bash
source common.sh

CHECK_ROOT

CREATE_LOG

COLORS

curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | bash &>>$LOGFILE

curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | bash &>>$LOGFILE

yum install rabbitmq-server -y  &>>$LOGFILE

systemctl enable rabbitmq-server  &>>$LOGFILE

systemctl start rabbitmq-server  &>>$LOGFILE

rabbitmqctl add_user roboshop roboshop123 &>>$LOGFILE

rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*" &>>$LOGFILE