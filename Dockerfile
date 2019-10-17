# use a node base image
FROM node:7-onbuild

# set maintainer
LABEL maintainer "samuel.davidov@gmail.com"

RUN mkdir /apps/
RUN mkdir /apps/merchantTool/
RUN  curl -X GET https://nexus.credorax.com/nexus/service/local/repositories/releases/content/com/credorax/merchant-tool/1.0.1/merchant-tool-1.0.1.jar > /apps/merchantTool/merchantTool.jar

# set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:8000 || exit 1

# tell docker what port to expose
EXPOSE 8000