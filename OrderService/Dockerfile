FROM openjdk:17-jdk-slim

WORKDIR /app/OrderService
COPY . .

RUN ["./mvnw", "clean", "install"]

ENTRYPOINT ["./mvnw","spring-boot:run"]
EXPOSE 8080
