FROM openjdk:8
EXPOSE 8080
ADD target/magam.jar magam.jar
ENTRYPOINT ["java","-jar","/magam.jar"]
