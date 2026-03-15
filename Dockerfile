# Stage 1 - Build
FROM maven:3.9.6-eclipse-temurin-11 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package

# Stage 2 - Tomcat
FROM tomcat:9-jdk11
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]