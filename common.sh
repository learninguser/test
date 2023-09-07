CREATE_LOG(){
    DATE=$(date +%F)
    LOGSDIR=/tmp
    # /home/centos/shellscript-logs/script-name-date.log
    SCRIPT_NAME=$0
    LOGFILE=$LOGSDIR/$0-$DATE.log
}

COLORS(){
    R="\e[31m"
    G="\e[32m"
    N="\e[0m"
    Y="\e[33m"
}

CHECK_ROOT(){
    USERID=$(id -u)
    if [ $USERID -ne 0 ];
    then
        echo -e "$R ERROR:: Please run this script with root access $N"
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ];
    then
        echo -e "$2 ... $R FAILURE $N"
        exit 1
    else
        echo -e "$2 ... $G SUCCESS $N"
    fi
}