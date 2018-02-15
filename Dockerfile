FROM hseeberger/scala-sbt
ENV DB_DEFAULT_URL="jdbc:mysql://localhost:3306/play"
ENV DB_DEFAULT_USER="mysql_user"
ENV DB_DEFAULT_PASSWORD="SECCURE12345"
RUN mkdir /sampleService
WORKDIR /sampleService
COPY . /sampleService
RUN cd /sampleService
RUN sbt flyway/flywayMigrate
RUN sbt slickCodegen
CMD ["sbt", "run"]

#CMD ["bash"]