FROM ubuntu:16.04

# Install Node.js
RUN apt-get update && apt-get upgrade -y
RUN apt-get install curl python-software-properties --yes
RUN apt-get install -y curl vim sudo net-tools 
RUN curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -
RUN apt-get install -y nodejs
RUN apt-get install -y build-essential

# Bundle app source
# Trouble with COPY http://stackoverflow.com/a/30405787/2926832
COPY . /src

# Install app dependencies
RUN cd /src; npm install

# Binds to port 8800
EXPOSE  8800

#  Defines your runtime(define default command)
# These commands unlike RUN (they are carried out in the construction of the container) are run when the container
CMD ["node", "/src/index.js"]
