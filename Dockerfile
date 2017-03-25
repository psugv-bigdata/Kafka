#Make sure that you have twitterproducer.jar in the same folder as your Dockerfile
#Get latest ubuntu image
FROM ubuntu:latest

#Update the repository and install zookeeper
RUN apt-get update && apt-get install -y default-jre zookeeperd wget tar

#Make installation directory
RUN mkdir kafka-install && \
mkdir /opt/kafka

#Install Kafka
RUN wget "http://mirror.cc.columbia.edu/pub/software/apache/kafka/0.8.2.1/kafka_2.11-0.8.2.1.tgz"
RUN tar -xvzf kafka_2.11-0.8.2.1.tgz --strip 1 -C /opt/kafka && \
echo "delete.topic.enable = true" >> /opt/kafka/config/server.properties

#Copy the Kafka producer jar inside the container
COPY twitterkafkaproducer.jar /opt/kafka/

#Start zookeeper
CMD ["/opt/kafka/bin/zookeeper-server-start.sh","/opt/kafka/config/zookeeper.properties"]

#Start kafka server
CMD ["/opt/kafka/bin/kafka-server-start.sh","/opt/kafka/config/server.properties","&"]

#Run the kafka producer which will start collecting the tweets
ENTRYPOINT ["java","-jar","/opt/kafka/twitterkafkaproducer.jar","&"]

#Open ports
EXPOSE 2181
EXPOSE 9092
