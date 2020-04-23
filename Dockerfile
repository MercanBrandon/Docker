FROM ubuntu:18.04

RUN apt-get -yq update && apt-get -yq upgrade \
&& apt-get -y install python3 \
&& apt-get -y install python-pip \
&& apt-get -y install python-dev \
&& alias python=python3 \ 
&& apt-get -y install ipython3 \
&& pip install jupyter \ 
&& pip install --upgrade pip \
&& pip install jupyter 

ADD . /app/

WORKDIR /app

EXPOSE 8000

CMD ["sh", "-c" , "jupyter notebook --no-browser --port=8000 --ip='0.0.0.0' --allow-root"]