# Cria uma imagem do tomcat na versão 8.5.50, compatível com o projeto

FROM openjdk:8-jdk-slim

ENV TOMCAT_MAJOR=8
ENV TOMCAT_VERSION=8.5.50
ENV CATALINA_HOME=/usr/local/tomcat
ENV PATH=$CATALINA_HOME/bin:$PATH

# Dependências essenciais
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        wget \
        ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Download e instalação do Tomcat
RUN wget -O /tmp/tomcat.tar.gz "https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR}/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz" && \
    tar -xvf /tmp/tomcat.tar.gz -C /usr/local/ && \
    mv /usr/local/apache-tomcat-${TOMCAT_VERSION} $CATALINA_HOME && \
    rm /tmp/tomcat.tar.gz

# Remove a restrição de IP do Tomcat Manager copiando o context.xml personalizado
COPY ./tomcat-config/context.xml $CATALINA_HOME/webapps/manager/META-INF/context.xml
COPY ./tomcat-config/context.xml $CATALINA_HOME/webapps/host-manager/META-INF/context.xml

# Copia as configurações de usuário 
COPY ./tomcat-config/tomcat-users.xml $CATALINA_HOME/conf/

# Copia os arquivos de deploy .war
COPY ./tomcat-apps/*.war $CATALINA_HOME/webapps/

# porta padrão do tomcat
EXPOSE 8080

# Comando para iniciar o Tomcat
CMD ["catalina.sh", "run"]