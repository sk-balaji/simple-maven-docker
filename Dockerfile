FROM alpine/git
FROM maven:3.5-jdk-8-alpine
RUN mvn install (1)
FROM openjdk:8-jre-alpine
COPY --from=1 /target/demo-0.0.1-SNAPSHOT.jar /simple-maven-docker (4)
CMD ["java -jar demo-0.0.1-SNAPSHOT.jar"] (5)