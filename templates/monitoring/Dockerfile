# Dockerfile for running api.jar with OpenTelemetry Java Agent
FROM eclipse-temurin:17-jre

WORKDIR /app

# Copy application jar
COPY api.jar /app/api.jar

# Download OpenTelemetry Java agent
RUN wget -O /app/opentelemetry-javaagent.jar https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/latest/download/opentelemetry-javaagent.jar

CMD ["sh", "-c", "java $JAVA_OPTS -jar /app/api.jar"]
