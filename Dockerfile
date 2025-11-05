FROM maven:3.9.11-eclipse-temurin-25-noble AS build
RUN apt-get update && apt-get install git -y
LABEL project="spring-petclinic"
WORKDIR /java
ARG URL=https://github.com/spring-projects/spring-petclinic.git
ARG DIR=spring-petclinic
RUN git clone $URL && \
     cd $DIR && \
     mvn package

FROM eclipse-temurin:25_36-jre AS run
COPY --from=build java/$DIR/target/*.jar app.jar
EXPOSE 8080
CMD ["java","-jar","app.jar"]