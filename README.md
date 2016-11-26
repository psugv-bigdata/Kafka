# Kafka
- This is a step by step guide to start a docker container for Apache Kafka with Zookeeper on Ubuntu 16.04 Container.
- Please ensure that you have the corresponding Dockerfile before following the procedure steps.
- Kafka will be running on port 9092 inside the docker container and the host port to access it is 9092.
- Kafka needs zookeeper which is running on port 2181.
- File to configure zookeeper can be found at /opt/kafka/config/zookeeper.properties
- File to configure kafka server can be found at /opt/kafka/config/server.properties

Steps:
------
1. Ensure that docker is installed on your host machine.
2. Ensure that the Dockerfile is placed in required directory. Usually it is best practice to keep it in your /home.
3. Make sure that the file is spelled correctly i.e "Dockerfile". If file has other name, extension then this doesn't work
4. We need to build the image before it can be deployed in the docker engine. Navigate to directory where the Docker file is placed and run the below command :

- $ docker build .

* Note the image id at displayed by docker at the end of the successful build. It should be something similar to this 85f9ce11db88. 

* The container can be deployed/run on the host machine using the below command. Note tomcat apps will be analyzed by sonarqube:
- $ docker run --name kafka -d -p 9092:9092 -p 2181:2181 6fecc596374c

* Please note your image id may be different than 6fecc596374c

* -d switch runs image in detached mode and -p forwards the hostport:destination port likewise.

* You can check status of available containers and images using command to see the
- $ docker ps -a

-You should see the name of your container with the associated Container id with current status

* Allow connections to specified port on the host machine using the following command:
- $ sudo ufw allow 9092
- $ sudo ufw allow 2181


