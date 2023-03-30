FROM ubuntu:22.04
RUN apt update
RUN apt-get install -y apache2
COPY /dk12_website/dist/ /var/www/html/dk12_website/
WORKDIR /var/www/html/dk12_website/
RUN cp /var/www/html/dk12_website/index.html /var/www/html/index.html
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
EXPOSE 8080