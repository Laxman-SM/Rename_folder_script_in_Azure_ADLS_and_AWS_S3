####
#### Commands for uploading files in S3 using HDFS client on Ubuntu 18.04 ####
####

#### Step 1. Set parameters ####
export s3="<<your s3 name, globally unique>>"
export AWS_ACCESS_KEY_ID="<<my key id>>"
export AWS_SECRET_ACCESS_KEY="<<my key access>>"

#### Step 2. Create S3 bucket ####
aws configure
aws s3 mb s3://$s3

#### Step 3. Install JDK8 and Hadoop 3.2.0
sudo apt install openjdk-8-jdk
wget apache.40b.nl/hadoop/common/hadoop-3.2.0/hadoop-3.2.0.tar.gz
tar -xvf hadoop-3.2.0.tar.gz
cd hadoop-3.2.0

#### Step 4. Add classpath variables to Haddop
vi etc/hadoop/hadoop-env.sh
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export HADOOP_CLASSPATH=$HADOOP_CLASSPATH:share/hadoop/tools/lib/*
:x!

#### Step 5. Created nested folder structure in S3 with 10000 files ####
mkdir -p ~/dev/data/projectA
touch  ~/dev/data/projectA/samplefile{00001..10000}.txt
ls ~/dev/data/projectA

#### Step 6. Copy 10000 files to S3 using HDFS command (takes more than 1 hour)
bin/hdfs dfs -cp ~/dev/data/projectA s3a://$s3/