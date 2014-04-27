### Introduction

This repository contains the script for the first Peer Assessment assignment for
Getting and Cleaning Data. The script combines and organizes accelerometer data
from the Samsung Galaxy Smartphone.

### run_analysis.R

This file contains all of the code to extract and clean that data files found
in the user's working directory.

It imports the data into a data_frame in R and then applies labels, 
and adds activity and subject info.

It finds the mean() and std() columns using grep and then exports them to a new
data_frame.

It creates a tidy data set as outlined in the assignment instructions.