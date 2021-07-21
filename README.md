# direct-msg-monitor-sboot

Configuration Message Monitoring Standalone Spring Boot Micro-service Application based on  Direct Java RI6

## Build Component
This project is using maven pom.xml file for the build lifecyle.

`mvn clean install`

## Running Component
To run thins project locally with default configuration:

`java -jar direct-msg-monitor-sboot-<version>.jar`

For a custom configuration please use externalized `application.properties` along with the JAR file.

## Microservice health check

`msg-monitor` has available health check through the Spring Boot Actuator at

`http://<host>:<port>/actuator`

## Microservice containerization

Microservice application should be built and ready to deploy using `mvn clean isntall` command or full package built form `direct-ri-build-microsrvcs` project.

To create docker image for `msg-monitor` run command below:

`docker build -t msg-monitor:latest .`

When running created image containerized microservice will start on default port `8081`.

## Dependencies

Running `rabbitmq` message broker with specified connection to it in the `Dockerfile`