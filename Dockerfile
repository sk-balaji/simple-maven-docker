FROM alpine/git
WORKDIR /app
RUN git clone https://github.com/sk-balaji/simple-maven-docker.git (1)
FROM maven:3.5-jdk-8-alpine
WORKDIR /app
COPY --from=0 /app/demo /app (2)
RUN mvn install (3)
FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=1 /app/target/demo-0.0.1-SNAPSHOT.jar /app (4)
CMD ["java -jar demo-0.0.1-SNAPSHOT.jar"] (5)