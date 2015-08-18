#Usage
This docker sends a number of system metrics to a configurable graphite instance.

This docker does not use linking because chances are substantial the graphite runs on a different host. As such environment variables are supported. When using Maestro-ng this is done automatically as long as the graphite service is named 'graphite' and the instance 'gp1' and the port 'line\_receiver'

If Maestro is not used, these variables are mandatory:
* GRAPHITE\_GP1\_HOST: The host to which to send the metrics to (via line receiver)
* GRAPHITE\_LINE\_RECEIVER\_PORT: The port on which to send the metrics to.

Example:

	docker run -d -e GRAPHITE_GP1_HOST=10.0.0.3 -e GRAPHITE_LINE_RECEIVER_PORT=2003 visity/monitor-host