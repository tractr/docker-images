# Base image with auto-gpt
FROM significantgravitas/auto-gpt:0.2.2

# Install dependencies
USER root
RUN apt install -y build-essential cmake git libjson-c-dev libwebsockets-dev tini && \
    rm -rf /var/lib/apt/lists/*

# Build ttyd
RUN git clone https://github.com/tsl0922/ttyd.git
RUN cd ttyd && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make && \
    make install

USER appuser

# Expose web terminal port
EXPOSE 7681

# Start web terminal with auto-gpt
ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["ttyd", "-p", "7681", "python", "-m", "autogpt"]
