FROM centos:latest

RUN mkdir /openresty
WORKDIR /openresty

RUN yum install -y pcre-devel openssl-devel gcc curl wget perl make sed net-tools
RUN cd /openresty
RUN wget https://openresty.org/download/openresty-1.15.8.1.tar.gz
RUN tar -zxvf openresty-1.15.8.1.tar.gz
WORKDIR /openresty/openresty-1.15.8.1
RUN cd /openresty/openresty-1.15.8.1
RUN pwd
RUN ls -al
RUN ./configure
RUN gmake
RUN gmake install
RUN sed -i '$a\export PATH=$PATH:/usr/local/openresty/nginx/sbin:/usr/local/openresty/bin/' /etc/profile
RUN source /etc/profile
RUN mkdir -p /lua
RUN mkdir -p /usr/local/openresty/nginx/conf/conf.d
RUN nginx &

# RUN yum install -y pcre-devel openssl-devel gcc curl wget perl make \
#           && cd ~ \
#           && wget https://openresty.org/download/openresty-1.15.8.1.tar.gz \
#           && tar -zxvf openresty-1.15.8.1.tar.gz \
#           && cd openresty-1.15.8.1 \
#           && ./configure \
#           && gmake \
#           && gmake install \
#           && PATH=$PATH:/usr/local/openresty/nginx/sbin:/usr/local/openresty/bin/ \
#           && mkdir -p /lua \
#           && mkdir -p /usr/local/openresty/nginx/conf/conf.d \
#           && nginx &

EXPOSE 80 443