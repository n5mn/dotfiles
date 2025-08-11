#!/bin/sh

if [ -f ~/.cache/ags_disabled ]; then
    rm ~/.cache/ags_disabled
		ags run

else
    touch ~/.cache/ags_disabled
    ags quit
fi
