FROM openjdk:8
EXPOSE 8080
ADD target/vetukuri.jar vetukuri.jar
ENTRYPOINT ["java","-jar","/vetukuri.jar"]
