#!/bin/bash

if [ -z "$GRAPHITE_HOST" ]; then
	if [ -n "$GRAPHITE_GP1_HOST" ]; then
		GRAPHITE_HOST=`echo "$GRAPHITE_GP1_HOST"`
	fi
fi

if [ -z "$GRAPHITE_LINE_RECEIVER_PORT" ]; then
	if [ -n "$GRAPHITE_GP1_LINE_RECEIVER_PORT" ]; then
		GRAPHITE_LINE_RECEIVER_PORT=`echo "$GRAPHITE_GP1_LINE_RECEIVER_PORT"`
	fi
fi

if [ -n "$GRAPHITE_HOST" ]; then
   sed 's/{{graphite_host}}/'"$GRAPHITE_HOST"'/' -i /etc/diamond/diamond.conf;
else
	echo "Diamond: No GRAPHITE_HOST or GRAPHITE_GP1_HOST defined. Aborting.";
	exit 1;
fi

if [ -n "$GRAPHITE_LINE_RECEIVER_PORT" ]; then
  sed 's/{{graphite_line_receiver_port}}/'"$GRAPHITE_LINE_RECEIVER_PORT"'/' -i /etc/diamond/diamond.conf;
else
	echo "Diamond: No GRAPHITE_LINE_RECEIVER_PORT or GRAPHITE_GP1_LINE_RECEIVER_PORT defined. Aborting.";
	exit 1;
fi