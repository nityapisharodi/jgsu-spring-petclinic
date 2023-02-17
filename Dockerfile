FROM alpine:latest as build
#updating apk and installing maven
RUN apk update
RUN apk add maven
#determine work directory 
WORKDIR /app
#Move the source code to the working directory
COPY . .
#Run the executable script to install all the dependencies
RUN ./mvnw package

#create a multi-stage image to reduce complexity and image size
FROM alpine:latest
#Install jdk and set its corresponding environment variables
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk
ENV PATH="$PATH:$JAVA_HOME/bin"
RUN apk add openjdk11
#deterrmine the working directory
WORKDIR /app
#Copy the executable .jar file for the application from the previous image build to the current image working directory
COPY --from=build /app/target/*.jar .
#Run the application 
CMD [ "java", "-jar", "spring-petclinic-2.3.1.BUILD-SNAPSHOT.jar" ]