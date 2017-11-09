FROM alpine

# Here we install GNU libc (aka glibc) and set C.UTF-8 locale as default.

RUN echo "https://mirrors.ustc.edu.cn/alpine/v3.6/main" > /etc/apk/repositories \
    && echo "https://mirrors.ustc.edu.cn/alpine/v3.6/community" >> /etc/apk/repositories \
    && apk update \
    && apk add curl

