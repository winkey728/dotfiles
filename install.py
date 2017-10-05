#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import logging
import os
import subprocess
import sys

SUBMODULE_INSTALL_FILE = 'install.py'

logging.basicConfig(level=logging.INFO)

def getdirs(path='.', ignore_hidden=True):
    return [d for d in os.listdir(path) if (ignore_hidden and not d.startswith('.')) and os.path.isdir(d)]

def find_command(dir='.', default=SUBMODULE_INSTALL_FILE):
    logging.debug('Find command from: %s' % dir)
    cmdlist = [f for f in os.listdir(dir) if os.path.isfile(f) and f == default]
    logging.debug('Found command list: %s' % cmdlist)
    if not cmdlist:
        return None
    else:
        return cmdlist[0]

def submodule_install():
    logging.info('Starting ......')
    for dir in getdirs('.'):
        logging.debug('Found directory: %s' % dir)
        dirpath = os.path.join(os.getcwd(), dir)
        cmd = find_command(dirpath)
        logging.debug('Found cmd [%s] in %s' % (cmd, dirpath))
        if cmd:
            logging.info('Run [%s] in %s' % (cmd, dir))
            try:
                subprocess.check_call([os.path.join(dirpath, cmd)], stdout=sys.stdout)
            except subprocess.CalledProcessError as e:
                logging.error('Command [%s] raise an exception' % cmd, exc_info=True)
    logging.info('Done !!!')

if __name__ == '__main__':
    submodule_install()
