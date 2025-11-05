FROM maven:3.9.11-eclipse-temurin-25-noble as build
RUN apt-get update && apt-get install git -y
WORKDIR /java
RUN git clone https://github.com/spring-projects/spring-petclinic.git && \
     cd spring-petclinic && \
     mvn package

FROM eclipse-temurin:25_36-jre as RUN
COPY --from=build java/spring-petclinic/target/*.jar app.jar
CMD ["java","-jar","app.jar"]