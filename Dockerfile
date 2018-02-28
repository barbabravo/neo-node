FROM ubuntu
MAINTAINER <bluers.z@gmail.com>

COPY aliyun.list /etc/apt/sources.list.d/
COPY neo-cli /neo-cli
RUN apt-get update
RUN apt-get install -yqq curl libleveldb-dev sqlite3 libsqlite3-dev libunwind8-dev 
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg && mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg

RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-trusty-prod trusty main" > /etc/apt/sources.list.d/dotnetdev.list'

RUN apt-get install -yqq apt-transport-https && apt-get update && apt-get install -yqq dotnet-sdk-2.1.4

EXPOSE 10331 
EXPOSE 10332 
EXPOSE 10333 
EXPOSE 10334 
EXPOSE 20331 
EXPOSE 20332 
EXPOSE 20333 
EXPOSE 20334

#RUN chmod a+x /neo-cli/startup
#CMD ["/neo-cli/startup"]

