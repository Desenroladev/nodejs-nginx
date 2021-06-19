
FROM nginx

LABEL version="1.0.0" description="Container Nginx e NodeJS" maintainer="Antoniel Lima<antoniel@desenroladev.com.br>"

WORKDIR /app

COPY ./start.sh /start.sh
COPY ./app /app

RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt-get install -y nodejs
RUN npm install

COPY ./default.conf /etc/nginx/conf.d/default.conf

ENV PORT=3000


EXPOSE 80

CMD [ "/start.sh" ]
