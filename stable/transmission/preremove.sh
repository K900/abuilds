#!/bin/sh
if id transmission &>/dev/null; then
	echo "Removing transmission user..."
	userdel transmission >/dev/null
else
	echo "transmission user doesn't exist."
fi
