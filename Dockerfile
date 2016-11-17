#Get latest ubuntu image
FROM ubuntu:latest

RUN apt-get update && apt-get install -y default-jre zookeeperd wget

RUN mkdir kafka-install && \
mkdir /opt/kafka

RUN wget "http://mirror.cc.columbia.edu/pub/software/apache/kafka/0.8.2.1/kafka_2.11-0.8 && \
tar -xvzf /kafka-install/kafka.tgz --strip 1 -C /opt/kafka && \
echo "delete.topic.enable = true" >> /opt/kafka/config/server.properties

CMD /opt/kafka/bin/zookeeper-server-start.sh /opt/kafka/config/zookeeper.properties
CMD /opt/kafka/bin/kafka-server-start.sh /opt/kafka/config/server.properties

CMD while true; do sleep 1000; done

