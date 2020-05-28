
FROM python:3.8-buster

RUN apt-get clean && apt-get update --fix-missing \
	&& apt-get upgrade -y \
  && apt-get install -y apt-utils \
    lsb-release \
		locales-all \
  	apt-transport-https

RUN pip install --upgrade setuptools wheel pip


COPY requirements.txt ./

RUN pip install -r requirements.txt
