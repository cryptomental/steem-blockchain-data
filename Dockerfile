FROM ubuntu:16.04

# Set witness data directory
ENV WITNESS_NODE_DATA_DIR=/steemdata/witness_node_data_dir/

# Install wget to fetch packages
RUN apt-get update && apt-get install -qy wget unzip

# Download blockchain data
RUN wget --no-parent --directory-prefix=/tmp -r -l1 http://steemd.ru 2>&1

# Unzip data to WITNESS_NODE_DATA_DIR and remove tmp files
RUN mkdir -p $WITNESS_NODE_DATA_DIR && \
    unzip '/tmp/steemd.ru/files/steem-blocks-and-index-*.zip' 'root/steem/programs/steemd/witness_node_data_dir/*' -d $WITNESS_NODE_DATA_DIR && \
    rm -rf /tmp/steemd.ru
