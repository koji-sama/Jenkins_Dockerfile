FROM ubuntu
ENV PATH="${PATH}:/opt/apache-maven-3.8.1/bin"
RUN apt-get update
RUN apt-get install git -y && \    
    git clone https://github.com/jenkinsci/jenkins.git ./home/jenkins && \
    apt-get install openjdk-11-jdk -y && \
    apt-get install wget -y && \
    wget -o- https://archive.apache.org/dist/maven/maven-3/3.8.1/binaries/apache-maven-3.8.1-bin.tar.gz && tar xzvf apache-maven-3.8.1-bin.tar.gz -C/opt && \
    mvn clean install -pl war -am -DskipTests -f /home/jenkins/
CMD java -jar /home/jenkins/war/target/jenkins.war
