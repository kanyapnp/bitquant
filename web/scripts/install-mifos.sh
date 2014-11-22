#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ME=`stat -c "%U" $SCRIPT_DIR/install-mifos.sh`
. $SCRIPT_DIR/norootcheck.sh
sudo /usr/share/bitquant/install-mifos-sudo.sh $SCRIPT_DIR $ME

if ! $(groups $(whoami) | grep &>/dev/null '\btomcat\b'); then
    echo "User not in tomcat group"
    exit
fi

mysqladmin -uroot -pmysql create 'mifosplatform-tenants'
mysqladmin -uroot -pmysql create 'mifostenant-default'