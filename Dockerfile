FROM eclipse-temurin:25_36-jre as Build
RUN git clone https://github.com/spring-projects/spring-petclinic.git && \
     cd spring-petclinic && \
     mvn package


