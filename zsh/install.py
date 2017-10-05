#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import logging
import os
from pathlib import Path
from git import Repo, RemoteProgress

logging.basicConfig(level=logging.INFO)

OH_MY_ZSH_DEFAULT_PATH = os.path.join(str(Path.home()), '.oh-my-zsh')
OH_MY_ZSH_CUSTOM_PLUGINS_PATH = os.path.join(OH_MY_ZSH_DEFAULT_PATH, 'custom', 'plugins', '')

OH_MY_ZSH_GIT_REPO = 'https://github.com/robbyrussell/oh-my-zsh.git'
OH_MY_ZSH_CUSTOM_PLUGINS_REPO = {
    'zsh-completions': 'https://github.com/zsh-users/zsh-completions.git',
    'zsh-autosuggestions': 'https://github.com/zsh-users/zsh-autosuggestions.git'
}

def ohmyzsh_exists(path=OH_MY_ZSH_DEFAULT_PATH):
    logging.debug('Check oh-my-zsh path exists: %s' % path)
    return os.path.exists(path)

def backup_orig_ohmyzsh(path=OH_MY_ZSH_DEFAULT_PATH):
    os.rename(path, path + '.orig')

def git_clone(url='', dest=''):
    Repo.clone_from(url, dest, progress=RemoteProgress(), branch='master')

def download_ohmyzsh():
    git_clone(OH_MY_ZSH_GIT_REPO, OH_MY_ZSH_DEFAULT_PATH)

def download_custom_plugins():
    for name, url in OH_MY_ZSH_CUSTOM_PLUGINS_REPO.items():
        git_clone(url, OH_MY_ZSH_CUSTOM_PLUGINS_PATH + name)

def install_ohmyzsh():
    if ohmyzsh_exists():
        backup_orig_ohmyzsh()
    download_ohmyzsh()
    download_custom_plugins()

def get_dir_files(dir):
    return [f for f in os.listdir(dir)
            if os.path.isfile(os.path.join(dir, f))
            and f != os.path.basename(__file__)]

def file_exists(path, file):
    return os.path.exists(os.path.join(path, file))

def backup_orig_file(fpath):
    os.rename(fpath, fpath + '.orig')

def symlink_file(src, dest, file):
    src_file = os.path.join(src, file)
    dest_file = os.path.join(dest, file)
    logging.debug('Creating symlink from "%s" to "%s"' % (src_file, dest_file))
    os.symlink(src_file, dest_file)

def create_symlinks():
    curdir = os.path.dirname(os.path.realpath(__file__))
    home = str(Path.home())
    for f in get_dir_files(curdir):
        logging.debug('Found file [%s] in %s' % (f, curdir))
        if file_exists(home, f):
            backup_orig_file(os.path.join(home, f))
        symlink_file(curdir, home, f)

def doinstall():
    logging.info('Start to initialize ZSH environment......')
    install_ohmyzsh()
    create_symlinks()
    logging.info('Completing the initialization of ZSH')

if __name__ == '__main__':
    doinstall()

