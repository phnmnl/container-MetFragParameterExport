FROM ubuntu:16.04

MAINTAINER PhenoMeNal-H2020 Project ( phenomenal-h2020-users@googlegroups.com )

LABEL version=0.1
LABEL software.version=1.0
LABEL software=mzml2metfrag

# Install development files needed
RUN apt-get update && apt-get -y install git openjdk-8-jdk-headless maven && git clone https://github.com/c-ruttkies/MetFragParameterExport.git && cd MetFragParameterExport && mvn clean install -am && mv target/MetFragParameterExport-0.1-jar-with-dependencies.jar /usr/local/bin/MetFragParameterExport-0.1.jar

# Clean up
RUN apt-get -y clean && apt-get -y autoremove && rm -rf /var/lib/{cache,log}/ /tmp/* /var/tmp/*

RUN apt-get -y purge maven git

ENTRYPOINT ["bash"]

# java -jar /usr/local/bin/MetFragParameterExport-0.1.jar
