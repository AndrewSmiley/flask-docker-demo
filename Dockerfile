FROM ubuntu
MAINTAINER The Tripod
# Update packages
RUN apt-get update -y

# Install Python Setuptools
RUN apt-get install -y tar git curl nano wget dialog net-tools build-essential
RUN apt-get install -y python python-dev python-distribute python-pip


# Install pip
RUN easy_install pip
ADD . /src
# Add and install Python modules
ADD requirements.txt /src/requirements.txt
RUN cd /src; pip install -r requirements.txt

# Expose
EXPOSE  5000
WORKDIR /src
CMD python run.py
