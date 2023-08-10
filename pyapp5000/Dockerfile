FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install python-all -y && \
    apt-get install python-pip -y

WORKDIR /tmp/
ADD ./requirements.txt /tmp/ 
RUN pip install -qr requirements.txt

WORKDIR /opt/webapp
ADD . app.py /opt/webapp/
EXPOSE 5000
CMD python3 app.py