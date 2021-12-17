FROM sebp/elk:7.16.1

# Update apt-get
RUN apt-get update
# Install pip
RUN apt-get install -y python3-pip
# Upgrade
RUN pip install --upgrade pip
# Install ES Curator with pip
RUN pip install -U elasticsearch-curator==5.8.4
# Cleaning
RUN apt-get autoclean

# Overwrite existing file
COPY logstash/conf.d/* /etc/logstash/conf.d/

# Copy curator config
COPY curator/*.yml /etc/curator/
# Copy curator runner
COPY curator/run-curator.sh /bin/run-curator
RUN chmod +x /bin/run-curator

