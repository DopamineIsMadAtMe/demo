FROM gradle:7.6-jdk11 AS build
WORKDIR /home/gradle/project
COPY . .
EXPOSE 8080

CMD ["gradle", "apprun"]

