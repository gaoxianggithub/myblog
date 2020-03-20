FROM  openjdk:8-jdk-alpine
MAINTAINER  gaoxianggithub 624545217@qq.com
ADD  ./target/img-dataset-builder-0.0.1-SNAPSHOT.jar  /home/images_dataset/
CMD  ["java", "-Xmx200m", "-jar", "/home/images_dataset/img-dataset-builder-0.0.1-SNAPSHOT.jar","--spring.profiles.active=prod"]
EXPOSE  8080
