FROM openjdk:17-jdk-slim

WORKDIR /app/InventoryService
COPY . .

RUN ["./mvnw", "clean", "install"]

ENTRYPOINT ["./mvnw","spring-boot:run"]
EXPOSE 8080
