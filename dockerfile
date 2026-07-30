#layer 1 - building the base 
#Tells docker to build python image from docker hub with version tag as 3.14.
#setting the base layer on which everthing in build on top.
FROM python:3.11-slim
#after using the docker build command it checks cheahe if it exists in cache


#layer 2 - Directory layer - Building the file system on top of base layer
# crates centralized file system with root as app.
WORKDIR /app

#layer 3 -configration layer - Enviornment variable, Setting up enviornment in file systems.
#if as we need to use the in env in this case.
ENV PYTHONDONTWRITEBYTECODE=1 \
	PYTHONUNBUFFERED=1 \
	PIP_NO_CACHE_DIR=1


#layer 4 - system dependencies layer- system setting in the machine
#example- if we use numpy for the project the insides of that code is written  in c hence it  need gcc complier to run  numpy,  
RUN apt-get update \ 
	&& apt-get install -y --no-install-recommends build-essential \
	&& rm -rf /var/lib/apt/lists/*
	#apt-get is the tool to download and install  software and in thi case it install all dependencies.
	#udate is getting the lates in list of ubntu's software store.
	#--no-install-recommends build-essential does not install extra stuff only the essential stuff here.
	# rm -rf /var/lib/apt/lists/* this code snippet deletes  the fir that we have downloaded using the using apt-get update command  using the update command.


#layer 5 - application dependencies layer-  installs all the dependencies in a container.
RUN pip install --upgrade pip \
	&& pip install numpy pandas scikit-learn matplotlib jupyterlab
	#&& pip install numpy pandas scikit-learn matplotlib jupyterlab - this line of code add the python dependenceis that are required by the our project in the container.


#layer 6 source code layer - copies all the scr code  to container
COPY main.py .
COPY housing_prediction.ipynb .
COPY datasets ./datasets

EXPOSE 8888

#layer 7 - runtime layer, tell where to run.
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
