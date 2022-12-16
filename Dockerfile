
FROM kalilinux/kali-rolling

# Let the container know there will be no TTY
ENV DEBIAN_FRONTEND=noninteractive
ENV SC_PATH "/snowcrash"
ENV LOCALHOST "localhost"
#ENV PORT 4242
#ENV LEVEL "info"

# From the upstream docker image
#RUN echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" > /etc/apt/sources.list && \
#    echo "deb-src http://http.kali.org/kali kali-rolling main contrib non-free" >> /etc/apt/sources.list

# Get the latest everything
RUN apt-get -y update && \
    apt-get -y dist-upgrade

# Install tools we want
RUN apt-get install -y \
    gdbserver \
    john \
    wireshark \
    metasploit-framework \
    libssl-dev \
    libffi-dev \
    build-essential \
    net-tools \
    git \
    tshark \
    nmap \
    sqlmap \
    wfuzz \
    exploitdb \
    nikto \
    commix \
    hashcat 

# Install Other tools
RUN apt-get install -y \
    gdb \
    sshpass 

# Install utils
RUN apt-get install -y \
    vim \
    git

RUN echo "Connecting to snowcrash ..."

RUN mkdir -p /scripts
COPY conect.sh /scripts
COPY LOL.sh /scripts
WORKDIR /scripts
RUN chmod +x conect.sh
RUN chmod +x LOL.sh
CMD ["/bin/bash"]
CMD ["./conect.sh"]

EXPOSE 4242