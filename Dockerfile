FROM openjdk:8
EXPOSE 8080
ADD target/Magam.jar Magam.jar
ENTRYPOINT ["java","-jar","/Magam.jar"]
