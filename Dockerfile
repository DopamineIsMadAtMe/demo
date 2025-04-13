FROM gradle:7.0-jdk11 AS build 
WORKDIR /home/gradle/project
COPY . .
EXPOSE 8080

CMD ["gradle", "apprun"]

# changed gradle:7.6 to 7.0
