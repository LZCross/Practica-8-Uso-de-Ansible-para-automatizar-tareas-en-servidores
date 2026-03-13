# Dockerfile para imagen de Ubuntu con SSH y usuario ansible

FROM ubuntu:latest

# Instalar SSH server y sudo
RUN apt-get update && apt-get install -y openssh-server sudo && rm -rf /var/lib/apt/lists/*

# Crear usuario ansible con password ansible
RUN useradd -m -s /bin/bash ansible && echo 'ansible:ansible' | chpasswd

# Dar privilegios sudo sin password a ansible
RUN echo 'ansible ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Configurar SSH
RUN mkdir /var/run/sshd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Exponer puerto 22
EXPOSE 22

# Comando para iniciar SSH
CMD ["/usr/sbin/sshd", "-D"]