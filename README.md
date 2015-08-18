#Usage
This docker sends a number of system metrics to a configurable graphite instance.

This docker does not use linking because chances are substantial the graphite runs on a different host. As such environment variables are supported. When using Maestro-ng this is done automatically as long as the graphite service is named 'carbon' and the instance 'carbon1' and the port 'line\_receiver'

If Maestro is not used, these variables are mandatory:
* CARBON\_HOST: The host to which to send the metrics to (via line receiver)
* CARBON\_LINE\_RECEIVER\_PORT: The port on which to send the metrics to.

Example:

	docker run -d -e CARBON_HOST=10.0.0.3 -e CARBON_LINE_RECEIVER_PORT=2003 visity/monitor-host