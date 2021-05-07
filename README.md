# *A. halleri* metal tolerance traits in a Bayesian Causal Network

## Background
This analysis uses a GPU enabled and cloud scalable [pytorch container](https://hub.docker.com/layers/pytorch/pytorch/1.7.1-cuda11.0-cudnn8-runtime/images/sha256-db6086be92f439b918c96dc002f4cf40239e247f0b1b6c32e3fb36de70032bf9?context=explore) base image. The `pytorch` image is modified by installing `gcc graphviz graphviz-dev nano vim`, and the python packages [CausalNex](https://causalnex.readthedocs.io/) as well as its associated dependencies and [pygraphviz](https://pygraphviz.github.io/) which is used to visualize the networks.

## Analysis

* A description of the most current analysis can be found written as a Jupyter Notebook in GoogleColab <a href="https://colab.research.google.com/drive/1d20Y10vlsGxlDij7_6DbVazD_FA3XJd0?usp=sharing" target="_blank">here</a>. 
 
* **NOTE:** the Colab Notebook will not have the CPU power to run the structure learning algorithm, it is very computationally intensive (~4 hrs on a server with >250 cores).

* Optionally this could use CyVerse to host a notebook with the analysis data??

---

## Running Docker Container Image:

### Example for running structure learning
Run the `causalnex` container image, in the detached state `-d`, by  mounting your current working directory (assumes the docker user is running the process within this repo folder) as the folder `/work` inside the spinning container. Executing the script for structure learning 

`docker run -d --rm --gpus all -v $(pwd):/work -w /work rbartelme/pytorch-causalnex:0.0.2 python /work/scripts/learn-structure.py`


---

## Experimental Notes:

* The experiment `/outputs/Apr06/` had many nodes, with weak connections, no pickling of structure model
* On the other hand,in `/outputs/May06/` switching from row-wise to column wise removal of `NaN` removes most of the dataset
* Rerunning with previous `NaN` removal behavior on May 07 2021
