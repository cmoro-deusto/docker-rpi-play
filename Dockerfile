FROM dordoka/rpi-java8:latest
MAINTAINER Carlos Moro <cmoro@deusto.es>

# Set locales
RUN locale-gen en_GB.UTF-8
ENV LANG en_GB.UTF-8
ENV LC_CTYPE en_GB.UTF-8

# Create editor userspace
RUN groupadd play
RUN useradd play -m -g play -s /bin/bash
RUN passwd -d -u play
RUN echo "play ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/play
RUN chmod 0440 /etc/sudoers.d/play
RUN mkdir /home/play/Code
RUN chown play:play /home/play/Code

# Install dependencies
RUN apt-get update
RUN apt-get install -y git build-essential curl 
WORKDIR /tmp
RUN wget http://downloads.typesafe.com/typesafe-activator/1.3.2/typesafe-activator-1.3.2.zip
RUN apt-get install -y zip unzip

# Install play
RUN unzip typesafe-activator-1.3.2.zip
RUN mv activator-1.3.2 /opt/activator 
RUN chown -R play:play /opt/activator
RUN echo "export PATH=$PATH:/opt/activator" >> /home/play/.bashrc

# Define user home. Activator will store ivy2 and sbt caches on /home/play/Code volume
RUN echo "export _JAVA_OPTIONS='-Duser.home=/home/play/Code'" >> /home/play/.bashrc

# Change user, launch bash
USER play
WORKDIR /home/play
CMD ["/bin/bash"]

# Expose Code volume and play ports 9000 default 9999 debug 8888 activator ui
VOLUME "/home/play/Code"
EXPOSE 9000
EXPOSE 9999
EXPOSE 8888
WORKDIR /home/play/Code
