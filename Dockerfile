FROM hseeberger/scala-sbt
#ENV DB_DEFAULT_URL="jdbc:mysql://127.0.0.1:3306/play"
#ENV DB_DEFAULT_USER="mysql_user"
#ENV DB_DEFAULT_PASSWORD="SECCURE12345"

ENV DB_DEFAULT_URL="jdbc:h2:tcp://127.0.0.1:3306/~/play;MODE=MYSQL"
ENV DB_DEFAULT_USER="root"
ENV DB_DEFAULT_PASSWORD="root"

RUN mkdir /sampleService
WORKDIR /sampleService
COPY . /sampleService
RUN cd /sampleService
#RUN apt-get install nmap
#RUN nmap -p 3306 localhost

RUN sbt flyway/flywayInfo
RUN sbt flyway/flywayMigrate
RUN sbt slickCodegen
CMD ["sbt", "run"]

#CMD ["bash"]