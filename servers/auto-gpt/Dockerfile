# Base image with auto-gpt
FROM significantgravitas/auto-gpt:v0.4.0

# Install dependencies
RUN apt install -y build-essential cmake git libjson-c-dev libwebsockets-dev tini && \
    rm -rf /var/lib/apt/lists/*

# Build ttyd
RUN git clone https://github.com/tsl0922/ttyd.git
RUN cd ttyd && \
    git checkout a2312cbfabcd085664626d4f16877125f2d8ad96
RUN cd ttyd && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make && \
    make install

ADD start.sh ./start.sh

# Copy configs
COPY prompt_settings.yaml /app/prompt_settings.yaml

# Expose web terminal port
EXPOSE 7681

# Start web terminal with auto-gpt
ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["ttyd", "-W", "-p", "7681", "-m", "1", "/app/start.sh"]
