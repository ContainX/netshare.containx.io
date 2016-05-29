FROM containx/jekyll-nginx

COPY . /src
COPY support/ /
WORKDIR /src
ENV JEKYLL_ENV=production
RUN cd /src  && jekyll build
