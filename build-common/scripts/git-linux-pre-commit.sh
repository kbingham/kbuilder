#!/bin/bash

if git rev-parse --verify HEAD 2>/dev/null >/dev/null
then
	against=HEAD
else
	# Initial commit: diff against an empty tree object
	against=4b825dc642cb6eb9a060e54bf8d69288fbee4904
fi

git diff --cached $against -- | ./scripts/checkpatch.pl --no-signoff -

