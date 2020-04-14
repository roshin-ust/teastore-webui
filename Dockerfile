FROM maven:3.6-jdk-8-alpine AS MAVEN_TOOL_CHAIN
COPY TeaStore-master /tmp/
WORKDIR /tmp/
#COPY .m2 /root/.m2
RUN mvn clean install -DskipTests

FROM tomcat:8.5-jre8

COPY baseContext.xml /usr/local/tomcat/conf/context.xml




COPY --from=MAVEN_TOOL_CHAIN /tmp/services/tools.descartes.teastore.webui/target/tools.descartes.teastore.webui.war /usr/local/tomcat/webapps/



