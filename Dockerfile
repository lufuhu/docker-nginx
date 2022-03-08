FROM centos:7
RUN yum update -y \
    && yum install -y wget gcc pcre-devel zlib-devel openssl openssl-devel \
    && wget https://nginx.org/download/nginx-1.21.2.tar.gz \
    && tar -zxvf nginx-1.21.2.tar.gz \
    && cd nginx-1.21.2 \
    && ./configure --prefix=/usr/local/nginx \
    && make \
    && make install \
    && cd ../ \
    && rm -fr nginx-1.21.2 \
    && rm -f nginx-1.21.2.tar.gz \
    && yum remove -y wget \
    && yum -y clean all