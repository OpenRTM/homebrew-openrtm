#!/bin/bash

brew_cellar=$(brew --cellar)

formulas="
    openrtm-aist
    openrtm-aist-py38
    openrtm-aist-py39
    openrtm-aist-py310
    openrtm-aist-python
    openrtm-aist-python-py38
    openrtm-aist-python-py39
    openrtm-aist-java
    "
brew_unlink()
{
    for f in $formulas; do
        if test -d $brew_cellar/$f ; then
            echo brew unlink $f
            brew unlink $f
        else
            echo Keg $f not found, skipped
        fi
    done
}

brew_uninstall()
{
    for f in $formulas; do
        if test -d $brew_cellar/$f ; then
            echo brew uninstall --ignore-dependencies $f
            brew uninstall $f
        else
            echo Keg $f not found, skipped
        fi
    done
}

if test "x$1" = "xuninstall" ; then
    brew_uninstall
else
    brew_unlink
fi
