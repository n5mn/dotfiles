#!/bin/sh

list_instances="$(qs list --all)"

# should be a better way to do this but im lazy
if [ "$list_instances" = "No running instances." ]; then
	qs -c nrmn -d

else
	qs -c nrmn kill
fi

