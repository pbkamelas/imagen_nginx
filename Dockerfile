##Descargamos una versión concreta de UBUNTU, a través del tag
FROM ubuntu:16.04
MAINTAINER PBKamelas "pbkamelas@gmail.com"

##Actualizamos el sistema
RUN apt-get update

##Instalamos nginx
RUN apt-get install -y nginx

##Creamos un fichero index.html en el directorio por defecto de nginx
#RUN echo 'Mi primer Dockerfile' > /usr/share/nginx/html/index.html
#RUN echo 'Mi primer Dockerfile' > /var/www/html/index.nginx-debian.html
VOLUME ["/var/www/html"]
ARG webpage
ADD $webpage /var/www/html

##Arrancamos NGINX a través de ENTRYPOINT para que no pueda ser
##modificado en la creación del contenedor
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]

##Exponemos el Puerto 80
EXPOSE 80
