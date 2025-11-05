FROM maven:3.9.11-eclipse-temurin-25-noble AS build
RUN apt-get update && apt-get install git -y
WORKDIR /java
ARG URL=https://github.com/spring-projects/spring-petclinic.git
RUN git clone $URL && \
     cd spring-petclinic && \
     mvn package

FROM eclipse-temurin:25_36-jre AS run
COPY --from=build java/spring-petclinic/target/*.jar app.jar
EXPOSE 8080
CMD ["java","-jar","app.jar"]