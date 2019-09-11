#!/bin/bash

title=`git log --oneline | head -n 1`

if (echo $title | grep -E "fixup|squash")
then
	signoff=--no-signoff
fi

./scripts/checkpatch.pl --strict $signoff -g HEAD

