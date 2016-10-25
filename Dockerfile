# Pull base image
# https://hub.docker.com/r/alanfranz/centos5-i386/
FROM alanfranz/centos5-i386

# Install EPEL repo
RUN rpm -ivh http://dl.fedoraproject.org/pub/epel/5/i386/epel-release-5-4.noarch.rpm

RUN sed -i 's/\$arch/i686/g' /etc/yum.repos.d/*
RUN sed -i 's/\$basearch/i386/g' /etc/yum.repos.d/*

# Install
RUN yum install -y \
  sudo \
  wget \
  gcc \
  gcc-c++ \
  make \
  unzip \
  openssl \
  openssl-devel \
  git \
  subversion \
  tar \
  boost-devel \
  glibc-devel \
  e2fsprogs-devel \
  gdb \
  valgrind \
  mysql-devel \
  cppcheck \
  postgresql93-devel; \
  yum -y clean all

ADD install_xercesc280.sh /script/
RUN /script/install_xercesc280.sh

ADD install_cmake351.sh /script/
RUN /script/install_cmake351.sh

ADD install_cryptopp563.sh /script/
RUN /script/install_cryptopp563.sh

ADD ./install_googletest170.sh /script/
RUN /script/install_googletest170.sh

ADD install_python2711.sh /script/
RUN /script/install_python2711.sh

ADD install_python351.sh /script/
RUN /script/install_python351.sh

ADD install_cpptools.sh /script/
RUN /script/install_cpptools.sh

# Add root files
ADD .bashrc /root/.bashrc

# Install
RUN yum install -y \
  vim-enhanced; \
  yum -y clean all

# Set environment variables
ENV HOME /root

# Define default command
CMD ["bash"]
