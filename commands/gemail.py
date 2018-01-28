#! /usr/bin/env python
#-*- coding:utf-8 -*-

# Copyright 2018-  <linrongbin16@gmail.com>

import sys
import os
sys.path.append('.')
import util

msg_list = [
        "Brief:",
        "    git config [email]",
        "Usage:",
        "    %s [email]" % util.command_name(),
        "Try again"]

util.check_help(msg_list)
util.check_repository()

email = util.merge_args()
os.system('git config --global user.email "%s"' % email)