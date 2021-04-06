# *A. halleri* metal tolerance traits in a Bayesian Causal Network

## Background
This analysis uses a GPU enabled and cloud scalable [pytorch container](https://hub.docker.com/layers/pytorch/pytorch/1.7.1-cuda11.0-cudnn8-runtime/images/sha256-db6086be92f439b918c96dc002f4cf40239e247f0b1b6c32e3fb36de70032bf9?context=explore) base image. The `pytorch` image is modified by installing `gcc graphviz graphviz-dev nano vim`, and the python packages [CausalNex](https://causalnex.readthedocs.io/) as well as its associated dependencies and [pygraphviz](https://pygraphviz.github.io/) which is used to visualize the networks.

## Analysis

1. Current analysis can be found written as a Jupyter Notebook in GoogleColab [here](https://colab.research.google.com/drive/1d20Y10vlsGxlDij7_6DbVazD_FA3XJd0?usp=sharing) 
  * **NOTE:** the Colab Notebook will not have the CPU power to run the structure learning algorithm, it is very computationally intensive (~4 hrs on a server with >250 cores).
