# Pull base image.
FROM base/archlinux:latest

# Update system 
RUN pacman -Syyu --noconfirm

RUN pacman -S base base-devel vim neovim openssh openvpn  nodejs rust go git mysql postgresql --noconfirm


# Set TERM environment variable 
ENV TERM=xterm

# Set hostname
ARG HOSTNAME=AbysallHex
RUN echo $HOSTNAME > /etc/hostname

# Add a non-root user with sudo privileges
RUN useradd -m -s /bin/bash abyssal && \
    echo 'AbyssalHex ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

# Repositories BlackArch > https://blackarch.org/tools.html
# Run https://blackarch.org/strap.sh as root and follow the instructions.
RUN curl -O https://blackarch.org/strap.sh

# Verify the SHA1 sum
RUN echo 26849980b35a42e6e192c6d9ed8c46f0d6d06047 strap.sh | sha1sum -c

# Set execute bit
RUN chmod +x strap.sh

# Run strap.sh
RUN sudo ./strap.sh

# Enable multilib following https://wiki.archlinux.org/index.php/Official_repositories#Enabling_multilib and run:
RUN sudo pacman -Syu --noconfirm

# Reconnaissance Tools
RUN sudo pacman -S subfinder --noconfirm
RUN sudo pacman -S sublist3r --noconfirm
RUN sudo pacman -S recon-ng --noconfirm
RUN sudo pacman -S whatweb --noconfirm
RUN sudo pacman -S theharvester --noconfirm

# Reverse Engineering Tools
RUN sudo pacman -S radare2 --noconfirm

# Network Scanning Tools
RUN sudo pacman -S nmap --noconfirm
RUN sudo pacman -S httprobe --noconfirm
RUN sudo pacman -S amass --noconfirm
RUN sudo pacman -S masscan --noconfirm
RUN sudo pacman -S sslscan --noconfirm
RUN sudo pacman -S nikto --noconfirm

# Web Application Testing Tools
RUN sudo pacman -S wafw00f --noconfirm
RUN sudo pacman -S ffuf --noconfirm
RUN sudo pacman -S gobuster --noconfirm

# Wireless Security Tools
RUN sudo pacman -S aircrack-ng --noconfirm

# Database Testing Tools
RUN sudo pacman -S sqlmap --noconfirm

# Password Cracking Tools
RUN sudo pacman -S hydra --noconfirm
RUN sudo pacman -S john --noconfirm
RUN sudo pacman -S hashcat --noconfirm

# Network Traffic Analysis Tools
RUN sudo pacman -S tcpdump --noconfirm

# Exploitation
RUN sudo pacman -S metasploit --noconfirm

# Set working directory
WORKDIR /home/AbyssalHex

# Define default command.
CMD ["/bin/bash"]
