# README

This repository contains two different versions of the Prokka containers. 

In the `conda` folder, you will find the version that is based on Conda. 

In the `centos` folder, you will find the version that does the full installation for CentOS, as described here: https://github.com/tseemann/prokka.

Note that to build the Docker image, you will need two things that are not in the repo:

1. The Prokka folder. To get this, navigate to the `centos` folder and clone it using the following command: ``` git clone https://github.com/tseemann/prokka.git ```


2. The newer `tbl2asn` binary. To get this, navigate to the `centos` folder and run the following command: ``` wget https://ftp.ncbi.nih.gov/toolbox/ncbi_tools/converters/by_program/tbl2asn/linux64.tbl2asn.gz ```


After you have obtained these dependencies, you can build the Docker image using the Dockerfile in the respective folders.

