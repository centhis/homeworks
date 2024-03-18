#!/bin/bash

systemctl daemon-reload
systemctl enable watchlog.service
systemctl enable watchlog.timer
systemctl start watchlog.service
systemctl start watchlog.timer
systemctl enable spawn-fcgi
systemctl start spawn-fcgi
systemctl enable httpd@first
systemctl start httpd@first
systemctl enable httpd@second
systemctl start httpd@second
