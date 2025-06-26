FROM openjdk:17-jdk-slim

WORKDIR /app/NotificationService
COPY . .

RUN ["./mvnw", "clean", "install"]

ENTRYPOINT ["./mvnw","spring-boot:run"]
EXPOSE 8080