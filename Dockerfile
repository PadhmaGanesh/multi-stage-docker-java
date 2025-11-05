FROM eclipse-temurin:25_36-jre as Build
RUN sudo apt-get git
RUN git clone https://github.com/spring-projects/spring-petclinic.git && \
     cd spring-petclinic && \
     mvn package


