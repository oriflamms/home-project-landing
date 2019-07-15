FROM nginx:alpine
EXPOSE 80
ENV NGINX_PORT=80
ENV HUGO_VERSION=0.38
ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz /tmp
RUN tar -xf /tmp/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz -C /tmp \
    && mkdir -p /usr/local/sbin \
    && mv /tmp/hugo /usr/local/sbin/hugo \
    && rm -rf /tmp/hugo_${HUGO_VERSION}_linux_amd64 \
    && rm -rf /tmp/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz \
    && rm -rf /tmp/LICENSE.md \
    && rm -rf /tmp/README.md
ADD . /src
RUN /usr/local/sbin/hugo --source="/src" --destination="/usr/share/nginx/html" --baseURL="$HUGO_BASEURL" && rm -rf /src

