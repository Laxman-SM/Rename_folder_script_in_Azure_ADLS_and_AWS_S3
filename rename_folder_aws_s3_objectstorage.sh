####
#### Commands for renaming folders in S3 using AWS CLI on Ubuntu 18.04 ####
####

#### Step 1. Set parameters ####
s3="<<your s3 name, globally unique>>"

#### Step 2. Create S3 account ####
aws configure
aws s3 mb s3://$s3

#### Step 3. Created nested folder structure in S3 with 10000 files ####
mkdir -p ~/dev/data/projectA
touch  ~/dev/data/projectA/samplefile{00001..10000}.txt
ls ~/dev/data/projectA
aws s3 cp ~/dev/data/projectA s3://$s3/dev/data/projectA --recursive 

#### Step 4. Rename folders ####
# Rename project A to project Aold (takes ~5 minutes)
aws s3 --recursive mv s3://$s3/dev/data/projectA s3://$s3/dev/data/projectAold
# Rename data to datagdpr (takes ~5 minutes)
aws s3 --recursive mv s3://$s3/dev/data s3://$s3/dev/datagdpr
# Rename dev to prd (takes ~5 minutes)
aws s3 --recursive mv s3://$s3/dev s3://$s3/prd

#### Step 5. Clean up ####
rm -r ~/dev
aws s3 --recursive rm s3://$s3 # takes 5 minutes
