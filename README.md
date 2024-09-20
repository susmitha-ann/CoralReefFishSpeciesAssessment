# CoralReefFishSpeciesAssessment
A machine learning project to assess the diversity of coral reef fishes in relation to environmental factors.

This project (created for a project for DSTI Master) aimed at predicting the diversity of fish species in coral reefs using various environmental data and machine learning models. The dataset used in this project was exported from the following research article:
[Coral reef fish species dataset on Dryad](https://datadryad.org/stash/dataset/doi:10.5061/dryad.xpnvx0kmn)

## Project Structure
The project is divided into several folders, each containing a specific set of resources related to different phases of the project:

## 01 - Data
This folder contains the CSV files with the datasets used for this project. For the files: SpecSiteList.csv and Species_diversity.csv the size is to important to be download directly with the other datasets when the project is doawload in a zip file. It that case to use them it's needed to go on the data folder and download each file individualy.

## 02 - Exploratory Data Analysis
This folder contains Jupyter notebooks that were used to perform an exploratory analysis of the datasets. These notebooks examine the relationships between different variables, visualize the data, and prepare it for the model training phase.

## 03 - Model Prediction
This folder contains Jupyter notebooks that outline the machine learning model-building process. The notebooks cover data preprocessing, feature engineering, model training, and evaluation. Various models are trained to predict fish diversity based on environmental factors. For [02-Model_2.ipynb](/03-Model%20Prediction/02-Model_2.ipynb), as the dataset is large, it requires significant storage and time to run, therefore it would be preferable to use a virtual environment for that purpose. 

## 04 - Results
This folder contains image files that display the results of the machine learning predictions.

## Getting Started
To start exploring the project, you can begin by opening the notebooks in the [02 - Exploratory Data Analysis](./02-Exploratory%20Data%20Analysis/) folder for an initial overview of the data and the findings from the exploratory phase. Once familiar with the data, you can move on to the [03 - Model Prediction](./03-Model%20Prediction/) folder, where the machine learning models are built and trained.


## Environment Setup
To replicate this project and execute the notebooks, ensure you have the proper environment set up. The project was built using Python and Jupyter Notebooks. You can restore the required packages using the [requirement_conda.txt](/requirement_conda.txt) file for Conda packages. For the packages not available via Conda, use the [requirement_pip.txt](/requirement_pip.txt) file.

## Citation
If you use the data or any part of this project, please refer to the original dataset hosted on Dryad:
[Coral reef fish species dataset on Dryad](https://datadryad.org/stash/dataset/doi:10.5061/dryad.xpnvx0kmn)

