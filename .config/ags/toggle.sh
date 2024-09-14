#!/bin/sh

if [ -f ~/.cache/ags_disabled ]; then
    rm ~/.cache/ags_disabled
    ags &

else
    touch ~/.cache/ags_disabled
    ags -q
fi
