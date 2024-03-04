# Start with a Maven base image to build the project
FROM maven:latest

# Set the working directory in the image
WORKDIR /app

# Copy the Maven project files to the image
COPY pom.xml .

# Copy the source code of the project
COPY src /app/src

# Build the project
RUN mvn package

# Run the JAR file from target directory
CMD ["java", "-jar", "target/interconversions.jar"]