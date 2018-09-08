FROM alpine/git
FROM maven:3.5-jdk-8-alpine
WORKDIR /app
COPY . .
RUN mvn install 
FROM openjdk:8-jre-alpine
WORKDIR /app
COPY /app/target/demo-0.0.1-SNAPSHOT.jar /app
CMD ["java -jar demo-0.0.1-SNAPSHOT.jar"] 