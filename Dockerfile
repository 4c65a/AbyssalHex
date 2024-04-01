# Pull base image.
FROM base/archlinux:latest

# Update system 
RUN pacman -Syyu --noconfirm

# Set TERM environment variable 
ENV TERM=xterm


# Repositories BlackArch
# Run https://blackarch.org/strap.sh as root and follow the instructions.
RUN curl -O https://blackarch.org/strap.sh

# Verify the SHA1 sum
RUN echo 26849980b35a42e6e192c6d9ed8c46f0d6d06047 strap.sh | sha1sum -c

# Set execute bit
RUN chmod +x strap.sh

# Run strap.sh
RUN sudo ./strap.sh

# Enable multilib following https://wiki.archlinux.org/index.php/Official_repositories#Enabling_multilib and run:
RUN sudo pacman -Syu

# Reconnaissance Tools
RUN apt-get install -y subfinder
RUN apt-get install -y sublist3r 
RUN apt-get install -y recon-ng 
RUN apt-get install -y whatweb 
RUN apt-get install -y theharvester

# Reverse Engineering Tools
RUN apt-get install -y radare2

# Network Scanning Tools
RUN apt-get install -y nmap
RUN apt-get install -y httprobe 
RUN apt-get install -y amass 
RUN apt-get install -y masscan
RUN apt-get install -y sslscan 
RUN apt-get install -y nikto

# Web Application Testing Tools
RUN apt-get install -y wafw00f
RUN apt-get install -y ffuf 
RUN apt-get install -y gobuster

# Wireless Security Tools
RUN apt-get install -y aircrack-ng 

# Database Testing Tools
RUN apt-get install -y sqlmap 

# Password Cracking Tools
RUN apt-get install -y hydra 
RUN apt-get install -y john
RUN apt-get install -y hashcat

# Network Traffic Analysis Tools
RUN apt-get install -y tcpdump

# Exploitation
RUN apt-get install -y metasploit-framework

# Set working directory
WORKDIR /home/

# Define default command.
CMD ["/bin/bash"]
