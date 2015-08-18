FROM        python:2.7

# Install diamond
RUN        pip install diamond==4.0.195

# Config it
COPY       diamond.conf /etc/diamond/
RUN        mkdir /var/log/diamond

# Copy the graphite endpoint script
COPY       set_graphite_endpoint.sh /tmp/

CMD        /tmp/set_graphite_endpoint.sh && /usr/local/bin/diamond --foreground
