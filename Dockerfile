FROM ubuntu
MAINTAINER Doug Land <dland@ojolabs.com>

# Install dependencies
RUN apt-get update
RUN apt-get install -y rubygems
RUN gem install --no-rdoc --no-ri riemann-client riemann-tools

# Set the hostname in /etc/hosts so that Riemann doesn't die due to unknownHostException
CMD echo 127.0.0.1 $(hostname) > /etc/hosts; /usr/local/bin/riemann-health -h $RIEMANN_PORT_5555_TCP_ADDR
