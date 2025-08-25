# Cria uma imagem do tomcat na versão 8.5.50, compatível com o projeto

FROM tomcat:8.5.50-jdk8-openjdk

LABEL maintainer="ana-carolina-rodrigues-rocha <anacarolina.rrocha@gmail.com>"

COPY ./tomcat-apps/*.war /usr/local/tomcat/webapps/

EXPOSE 8080