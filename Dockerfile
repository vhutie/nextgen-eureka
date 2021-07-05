FROM openjdk:8-jre-alpine
VOLUME /tmp
ADD target/*.jar app.jar
ENV JAVA_OPTS "-Xmx192m -Xms192m -Djava.security.egd=file:///dev/./urandom -XX:+HeapDumpOnOutOfMemoryError "
ENV CRITAL_MEMORY_SETTINGS "-XX:+UseSerialGC -Xss768k -XX:MinHeapFreeRatio=30 -XX:MaxHeapFreeRatio=55 -XX:GCTimeRatio=4 -XX:AdaptiveSizePolicyWeight=90 -XX:+TieredCompilation -XX:TieredStopAtLevel=1  -XX:MaxRAM=512m -XX:+UnlockDiagnosticVMOptions -XX:NativeMemoryTracking=summary -XX:+PrintNMTStatistics"
ENV TZ Africa/Johannesburg
ENV dynamic_port 8761
# NOT USE YET -XX:+UseG1GC
ENTRYPOINT [ "sh", "-c", "java ${JAVA_OPTS} -jar /app.jar --server.port=${dynamic_port}" ]