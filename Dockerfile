# Stage 1: Build the application
# Using a Maven image to build the Java application
FROM maven:3.8.5-openjdk-17-slim AS build

# Set the working directory inside the container for the build stage
WORKDIR /app

# Copy the source code into the container
# This assumes your 'src' directory contains your Java source files and pom.xml
COPY src ./src
COPY pom.xml .

# Build the application. 'mvn package' will create the JAR file in target/
# The -DskipTests flag is often used in Docker builds to speed up the process
# if tests are run elsewhere or not needed for the image. Remove if you need tests.
RUN mvn package -DskipTests

# Stage 2: Create the final, smaller runtime image
# Using a JRE (Java Runtime Environment) image for a smaller final image

FROM eclipse-temurin:17-jre-focal

# Set the working directory for the final application
WORKDIR /app

# Copy the JAR file from the 'build' stage to the current stage's /app directory
# The '--from=build' specifies that we are copying from the stage named 'build'
# The path '/app/target/*.jar' assumes your JAR is named something like 'your-app-name.jar'
# and is located in the 'target' directory within the 'build' stage's /app directory.
# Using a wildcard `*.jar` is safer if the exact JAR name might change.
COPY --from=build /app/target/my-greet-app.jar .

# Expose the port your application listens on (e.g., 8080 for a web app)
# This is optional but good practice for documentation and network configuration
# EXPOSE 8080

# Command to run the application when the container starts
# This should point to the JAR file you copied in the previous step
CMD ["java", "-jar", "my-greet-app.jar"]
