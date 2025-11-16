FROM openjdk:26-ea-trixie

ADD /target/cicd-demo.jar cicd-demo.jar


ENTRYPOINT [ "java", "-jar","/cicd-demo.jar" ]