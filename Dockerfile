FROM ubuntu:latest
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y curl systemctl
RUN curl -L https://github.com/itamae-kitchen/mitamae/releases/latest/download/mitamae-x86_64-linux.tar.gz \
    | tar xvz
RUN mv mitamae-x86_64-linux mitamae
COPY recipes /recipes
RUN ./mitamae local /recipes/nginx.rb
CMD ["systemctl", "start", "nginx"]