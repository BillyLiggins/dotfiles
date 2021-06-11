#!/usr/bin/env python

from __future__ import print_function
import os
from glob import glob
from os.path import abspath, join

ignoreFiles = ["init.vim",
               "install.sh",
               "install.py",
               "README.md"]


def install():
    home = os.getenv("HOME")
    # print("Creating symlinks")
    # filelist = [x for x in glob("*") if os.path.isfile(x)]
    # for removeFile in ignoreFiles:
    #     filelist.remove(removeFile)
    #
    tmpLink = ".tmpLink"
    try:
        os.remove(tmpLink)
    except FileNotFoundError:
        pass
    # for i, f in enumerate(filelist):
    #     target = "./{0}".format(f)
    #     linkName = "/home/billy/.{0}".format(f)
    #     print("copying file :", target, tmpLink)
    #     os.symlink(abspath(target), tmpLink)
    #     os.rename(abspath(tmpLink), linkName)
    #
    # os.makedirs("/home/billy/.config/nvim/", exist_ok=True)
    #
    # print("init.vim", "/home/billy/.config/nvim/init.vim")
    # os.symlink(abspath("init.vim"), tmpLink)
    # os.rename(abspath(tmpLink), "/home/billy/.config/nvim/init.vim")
    #
    # precommit hook
    print("Linking git hook")
    os.symlink(abspath("git-templates/"), tmpLink)
    os.rename(abspath(tmpLink), join(home, ".git-templates"))


if __name__ == "__main__":
    install()
