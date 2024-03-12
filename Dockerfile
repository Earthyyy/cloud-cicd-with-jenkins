FROM node:21-alpine3.18 as prebuild

WORKDIR /usr/src/app
COPY package.json .
RUN npm install
COPY . ./
RUN npm run build


FROM maven:3-eclipse-temurin-17-alpine as build
WORKDIR /usr/src/app
COPY --from=prebuild /usr/src/app .

RUN mvn install -DskipTests


FROM openjdk:17
COPY --from=build /usr/src/app/target/*.jar /usr/app/app.jar
WORKDIR /usr/app
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "app.jar"]