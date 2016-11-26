#Get latest ubuntu image
FROM ubuntu:latest

#Update the repository and install zookeeper
RUN apt-get update && apt-get install -y default-jre zookeeperd wget

#Make installation directory
RUN mkdir kafka-install && \
mkdir /opt/kafka

#Install Kafka
RUN wget "http://mirror.cc.columbia.edu/pub/software/apache/kafka/0.8.2.1/kafka_2.11-0.8.2.1.tgz" -O /$
tar -xvzf /kafka-install/kafka.tgz --strip 1 -C /opt/kafka && \
echo "delete.topic.enable = true" >> /opt/kafka/config/server.properties

#Start zookeeper
CMD ["/opt/kafka/bin/zookeeper-server-start.sh", "/opt/kafka/config/zookeeper.properties"]

#Start kafka server
CMD ["/opt/kafka/bin/kafka-server-start.sh", "/opt/kafka/config/server.properties"]

#Open ports
EXPOSE 2181
EXPOSE 9092
