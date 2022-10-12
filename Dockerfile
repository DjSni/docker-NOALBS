FROM ubuntu:jammy
ENV DEBIAN_FRONTEND="noninteractive" TZ="Europe/Berlin"
#ENV REPO="715209/nginx-obs-automatic-low-bitrate-switching"
#ENV VERSION=$(wget -q -O- https://api.github.com/repos/${REPO}/releases/latest | jq -r '.name')

RUN apt update && apt -y upgrade && apt -y install tar gzip curl wget git
RUN curl -s https://api.github.com/repos/715209/nginx-obs-automatic-low-bitrate-switching/releases/latest | grep "browser_download_url.*musl.tar.gz" \
    | cut -d : -f 2,3 | tr -d \"| wget -qi - \
    && tar xfvz noalbs-v*.tar.gz -C / \
    && rm noalbs-v*-x86_64-unknown-linux-musl.tar.gz \
    && mv /noalbs-v* /app \
    && mkdir /app/default \
    && mv /app/config.json /app/default/config.default \
    && rm /app/.env

#Test "
COPY start.sh /

# Start by default
CMD ["/start.sh"]
