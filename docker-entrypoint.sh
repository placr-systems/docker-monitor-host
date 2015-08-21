#!/bin/bash

set -e

if [ -z "$CARBON_HOST" ]; then
	if [ -n "$CARBON_CARBON1_HOST" ]; then
		CARBON_HOST=`echo "$CARBON_CARBON1_HOST"`
	fi
fi

if [ -z "$CARBON_LINE_RECEIVER_PORT" ]; then
	if [ -n "$CARBON_CARBON1_LINE_RECEIVER_PORT" ]; then
		CARBON_LINE_RECEIVER_PORT=`echo "$CARBON_CARBON1_LINE_RECEIVER_PORT"`
	fi
fi

if [ -n "$CARBON_HOST" ]; then
   sed 's/{{carbon_host}}/'"$CARBON_HOST"'/' -i /etc/diamond/diamond.conf;
else
	echo "Diamond: No CARBON_HOST or CARBON_CARBON1_HOST defined. Aborting.";
	exit 1;
fi

if [ -n "$CARBON_LINE_RECEIVER_PORT" ]; then
  sed 's/{{carbon_line_receiver_port}}/'"$CARBON_LINE_RECEIVER_PORT"'/' -i /etc/diamond/diamond.conf;
else
	echo "Diamond: No CARBON_LINE_RECEIVER_PORT or CARBON_CARBON1_LINE_RECEIVER_PORT defined. Aborting.";
	exit 1;
fi

# Add diamond as command if needed
if [ "${1:0:1}" = '-' ]; then
	set -- diamond "$@"
fi

# Drop root privileges if we are running statsd
if [ "$1" = 'diamond' ]; then
		chown -R diamond:diamond /var/log/diamond/
		exec gosu diamond "$@"
fi

# As argument is not related to statsd,
# then assume that user wants to run his own process,
# for example a `bash` shell to explore this image
exec "$@"