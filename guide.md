    # check if ufw service is running
    service ufw status
    # check if ssh is running
    service ssh status
    # check the current system is installed
    uname -a
    # check the current system is installed
    cat /etc/os-release

    # check groups of a user
    groups username
    # create a user
    adduser username

    vim /etc/login.defs
    vim /etc/security/pwquality.conf

    # create a group
    addgroup groupname

    # add user to group
    usermod -aG groupname username

    # check user password policy
    chage -l username

    # change hostname of the machine
    hostnamectl set-hostname newhostname
    # see my Ip
    hostname -I

    # check partitions
    lsblk

    # check ufw status
    ufw status

    # allow port
    ufw allow portnumber

    #check ssh port
    netstat -tulpn | grep ssh


    #see my cron jobs
    crontab -l
