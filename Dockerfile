FROM ubuntu:18.04

RUN sudo apt update \
&& sudo apt install python3-pip \
&& apt-get install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6 \
&& wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh \
&& bash ~/miniconda.sh -b -p $HOME/miniconda \
&& pip install notebook

ADD . /app/

WORKDIR /app

EXPOSE 8080

CMD jupyter notebook