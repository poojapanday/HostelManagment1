FROM maven:3.9.6-eclipse-temurin-17 AS build

FROM tomcat:9

WORKDIR /app

COPY . .

RUN mvn clean package -DskipTests

EXPOSE 8080

COPY target/HostelManagementSystem.war app.war

CMD ["java","-jar","app.war"]

COPY app.war /usr/local/tomcat/webapps/
