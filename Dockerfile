FROM maven:3.9.9-eclipse-temurin-25 as Build
RUN apt-get update && apt-get install git -y
RUN git clone https://github.com/spring-projects/spring-petclinic.git && \
     cd spring-petclinic && \
     mvn package

FROM eclipse-temurin:25_36-jre as RUN
COPY --from=Build /target/*.jar app.jar
CMD ["java","-jar","app.jar"]