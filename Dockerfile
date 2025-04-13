# FROM gradle:7.0-jdk11 AS build 
# WORKDIR /home/gradle/project
# COPY . .
# EXPOSE 8080

# CMD ["gradle", "apprun"]


FROM jenkins/jenkins:alpine
# switch to root user
USER root

# install docker on top of the base image
RUN apk add --update docker openrc

# Install Gradle dependencies
RUN apk add --no-cache \
    openjdk11 \
    bash \
    docker \
    curl \
    unzip

# Set Gradle version
ENV GRADLE_VERSION=7.6
ENV GRADLE_HOME=/opt/gradle
# Download and install Gradle
RUN mkdir -p ${GRADLE_HOME} && \
    curl -fsSL https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -o /tmp/gradle.zip && \
    unzip /tmp/gradle.zip -d /opt/gradle && \
    rm /tmp/gradle.zip

# Add Gradle to PATH
ENV PATH="${GRADLE_HOME}/gradle-${GRADLE_VERSION}/bin:${PATH}"

# Verify installation
RUN gradle -v