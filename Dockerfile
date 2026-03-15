FROM tomcat:9.0

# Remove default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR file (if it existed)
COPY target/HostelManagementSystem.war /usr/local/tomcat/webapps/

EXPOSE 8080


