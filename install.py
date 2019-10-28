from __future__ import print_function
import os
from glob import glob
import shutil
from os.path import abspath

ignoreFiles = ["init.vim",
        "install.sh",
        "install.py",
        "README.md"]

def install():
    print("Creating symlinks")
    filelist = [x for x in glob("*") if os.path.isfile(x)]
    for removeFile in ignoreFiles:
        filelist.remove(removeFile)

    # os.remove(".tmpLink")
    tmpLink=".tmpLink"
    for i,f in enumerate(filelist):
        target="./{0}".format(f)
        linkName="/home/billy/.{0}".format(f)
        print("copying file :", target, tmpLink)
        os.symlink(abspath(target), tmpLink)
        os.rename(abspath(tmpLink), linkName)

    os.makedirs("/home/billy/.config/nvim/", exist_ok=True)

    print("init.vim", "/home/billy/.config/nvim/init.vim")
    os.symlink(abspath("init.vim"), tmpLink)
    os.rename(abspath(tmpLink), "/home/billy/.config/nvim/init.vim")

if __name__ == "__main__":
    install()
