####
#### Commands for renaming folders in ADLS gen 1 using az cli on Ubuntu 18.04 ####
####

#### Step 1. Set environment variables ####
loc="westeurope"
rg="test-adlsfolderrename-rg"
adls="<<your adls name, globally unique>>"

#### Step 2. Create ADLS account ####
az login
az group create -l $loc -n $rg
az dls account create -n $adls -l $loc -g $rg

#### Step 3. Created nested folder structure in ADLS with 10000 files ####
mkdir -p ~/dev/data/projectA
touch  ~/dev/data/projectA/samplefile{00001..10000}.txt
ls ~/dev/data/projectA
az dls fs upload --account $adls --destination-path /dev/data/projectA --overwrite --source-path ~/dev/data/projectA

#### Step 4. Rename folders ####
# Rename project A to project Aold (takes ~5 seconds)
az dls fs move --account $adls --source-path /dev/data/projectA --destination-path /dev/data/projectAold 
# Rename data to datagdpr (takes ~5 seconds)
az dls fs move --account $adls --source-path /dev/data/ --destination-path /dev/datagdpr/ 
# Rename dev to prd (takes ~5 seconds)
az dls fs move --account $adls --source-path /dev/ --destination-path /prd/

#### Step 5. Clean up ####
rm -r ~/dev
az dls fs delete --account $adls --path /prd --recurse
