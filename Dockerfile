FROM openjdk:8u282-jre

# When build images, name with this tag
LABEL tag=msg-monitor

# Build arguments
ARG BUILD_VERSION=6.0

# Create and use local user and group
RUN addgroup direct && adduser direct --ingroup direct

# Set application location
RUN mkdir -p /opt/app
RUN chown direct:direct /opt/app
ENV PROJECT_HOME /opt/app

# Set microservice
ENV SERVICE_PORT=8081

# Set MYSQL env variables
ENV MYSQL_HOST=mysql
ENV MYSQL_PORT=3306
ENV MYSQL_DATABASE=nhind
ENV MYSQL_USER=nhind
ENV MYSQL_PASSWORD=nhind

# Set RabbitMQ env variables
ENV RABBIT_MQ_HOST=rabbitmq
ENV RABBIT_MQ_PORT=5672
ENV RABBIT_MQ_USERNAME=guest
ENV RABBIT_MQ_PASSWORD=guest

# Use local user and group
USER direct:direct

# Copy application artifact
COPY application.properties $PROJECT_HOME/application.properties
COPY target/direct-msg-monitor-sboot-$BUILD_VERSION.jar $PROJECT_HOME/msg-monitor.jar

# Switching to the application location
WORKDIR $PROJECT_HOME

# Run application
CMD ["java","-jar","./msg-monitor.jar"]
