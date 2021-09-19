#!/bin/bash

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
cleanup()
{
    for f in $formulas; do
        if test -d /usr/local/Cellar/$f ; then
            echo brew unlink $f
            brew unlink $f
        else
            echo Keg $f not found, skipped
        fi
    done
}

cleanup
