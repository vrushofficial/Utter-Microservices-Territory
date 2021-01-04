FROM maven:3.6-jdk-11 as build
COPY src /usr/src/consumer/src
COPY pom.xml /usr/src/consumer
RUN mvn -f /usr/src/consumer/pom.xml clean package -Dmaven.test.skip package

FROM gcr.io/distroless/java:11
COPY --from=build /usr/src/consumer/target/consumer-0.0.1-SNAPSHOT.jar /usr/consumer/consumer-0.0.1-SNAPSHOT.jar
EXPOSE 8100
ENTRYPOINT [ "java", "-jar", "/usr/consumer/consumer-0.0.1-SNAPSHOT.jar" ]