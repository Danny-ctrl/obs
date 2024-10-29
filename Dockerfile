FROM maven:3.8.7-eclipse-temurin-17

WORKDIR /usr/src/app

# Copia o arquivo pom.xml para o container
COPY pom.xml ./

# Instala dependências sem rodar a aplicação
RUN mvn dependency:resolve

# Copia todo o conteúdo do projeto
COPY . .

# Compila o projeto
RUN mvn compile

# Expõe a porta 3000
EXPOSE 3000

# Comando para rodar a aplicação
CMD ["mvn", "exec:java"]
