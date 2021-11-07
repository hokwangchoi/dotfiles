#!/bin/sh

xmodmap ~/.Xmodmap

# Clean start of emacs with init.el Lisp file.
emacs -q -l ./init.el
