#!/bin/bash
#rm -rf /run/httpd/* /tmp/httpd*
#/usr/sbin/httpd -DFOREGROUND
#/usr/sbin/crond -n $CRONDARGS
#/usr/sbin/sshd -D
/usr/bin/unlink /run/supervisor/supervisor.sock
/usr/bin/supervisord -c /etc/supervisord.conf
#/bin/bash
