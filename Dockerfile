FROM openjdk:8
EXPOSE 8080
ADD target/Suresh-Raju-Vetukuri-Project1.jar Suresh-Raju-Vetukuri-Project1.jar
ENTRYPOINT ["java","-jar","/Suresh-Raju-Vetukuri-Project1.jar"]
