FROM pytorch/pytorch:1.7.1-cuda11.0-cudnn8-runtime

# Install causalnex and apt-get statements

RUN apt-get update && apt-get install -y \
	gcc \
	graphviz \
	graphviz-dev \
	nano \
	vim

RUN pip install causalnex pygraphviz
