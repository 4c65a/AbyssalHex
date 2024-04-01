ARG ARCH=amd64

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
RUN sudo pacman -S subfinder
RUN sudo pacman -S sublist3r 
RUN sudo pacman -S recon-ng 
RUN sudo pacman -S whatweb 
RUN sudo pacman -S theharvester

# Reverse Engineering Tools
RUN sudo pacman -S radare2

# Network Scanning Tools
RUN sudo pacman -S nmap
RUN sudo pacman -S httprobe 
RUN sudo pacman -S amass 
RUN sudo pacman -S masscan
RUN sudo pacman -S sslscan 
RUN sudo pacman -S nikto

# Web Application Testing Tools
RUN sudo pacman -S wafw00f
RUN sudo pacman -S ffuf 
RUN sudo pacman -S gobuster

# Wireless Security Tools
RUN sudo pacman -S aircrack-ng 

# Database Testing Tools
RUN sudo pacman -S sqlmap 

# Password Cracking Tools
RUN sudo pacman -S hydra 
RUN sudo pacman -S john
RUN sudo pacman -S hashcat

# Network Traffic Analysis Tools
RUN sudo pacman -S tcpdump

# Exploitation
RUN sudo pacman -S metasploit-framework

# Set working directory
WORKDIR /home/AbyssalHex

# Define default command.
CMD ["/bin/bash"]
