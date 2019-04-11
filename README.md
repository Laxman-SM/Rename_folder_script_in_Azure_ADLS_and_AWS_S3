# Rename folder script in Azure ADLS and AWS S3
Two shell script to rename folders in two types of storage:
* Hierarchical file system (HFS) in Azure ADLS
* Object based storage in AWS S3

In both scripts the following steps are executed (tested on Ubuntu 18.04):

1.	Create a nested folder structure as follows: /dev/data/projectA 
2.	Add 10.000 files to the projectA folder
3.	Rename the folders as follows:
    1. projectA to projectAold
    2. data to datagdpr
    3. dev to prd
4. Clean up
