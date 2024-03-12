# Use the official Maven image to build your application
FROM node:21-alpine3.18 as prebuild



WORKDIR /usr/src/app
COPY package.json .

RUN npm install

COPY . ./

RUN npm run build


FROM maven:3-eclipse-temurin-17 as build
# Copy the source code and POM file into the image
COPY --from=prebuild /usr/src/app/* /usr/src/app/

# Set the working directory for subsequent commands
WORKDIR /usr/src/app

# Build the application (including frontend assets with frontend-maven-plugin)
RUN mvn clean install -DskipTests

# Use the official OpenJDK image to run your application
FROM openjdk:17

# Copy the built JAR file from the previous stage into this new stage
COPY --from=build /usr/src/app/target/*.jar /usr/app/app.jar

# Set the working directory
WORKDIR /usr/app

# Expose the port your application runs on
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "app.jar"]
