#!/bin/sh
if id transmission &>/dev/null; then
	echo "transmission user already exists."
else
	echo "Creating transmission user..."
	useradd -M -r transmission >/dev/null
fi
