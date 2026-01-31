FROM eclipse-temurin:17-jdk

WORKDIR /DockerDeployment

COPY target/cicd-demo.jar cicd-demo.jar

EXPOSE 8081

ENTRYPOINT ["java","-jar","cicd-demo.jar"]