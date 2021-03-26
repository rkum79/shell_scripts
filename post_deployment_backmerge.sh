#!/bin/bash
#######################################################################################
# This script is for Mule APIs Down Merge from Master Branch Develop Branch           #
# Author : Rajiv Kumar                                                                #
# Reviewed By: DevOps Team                                                            #
#######################################################################################
BRANCH_MASTER=refs/heads/master # Should be a build variable
BRANCH_DEVELOP=develop # Should be a build variable
#Clone repository from Master Branch
#git clone -b ${BRANCH_MASTER} ssh://bitbucketprod1.waters.com:7999/watms/${bamboo_maven_artifactId}.git
#Change Directory to sourecode for API
#cd ${bamboo_maven_artifactId}
#Execute mvn for exporting the current version and update it with increment and apending SNAPSHOT
SVERSION=$(mvn -Dexec.executable='echo' -Dexec.args='${project.version}' --non-recursive exec:exec -q )
major=$(echo $SVERSION | cut -c1)
var2=$(echo $SVERSION | cut -c2)
miner=$(echo $SVERSION | cut -c3)
var4=$(echo $SVERSION | cut -c4)
bug=$(echo $SVERSION | cut -c5)
bugInc=$((bug+1))
str="-SNAPSHOT"
versionLabel=$major$var2$miner$var4$bugInc$str
echo Current Version Name: $SVERSION
echo Updated Version: $versionLabel

##Checking the version and replacing it with incremental one
LN=$(grep -n "<version>" pom.xml | head -1 | awk -F ":" '{print $1}')
sed -i "$LN s/$SVERSION/$versionLabel/" pom.xml

#Commiting the updated pom.xml file in local 
git config --global user.email "sendmailrajiv@gmail.com"
git config --global user.name "rkum79"
git status
git commit -a -m 'AutoCommit: updated pom version and downmerge into develop'
#Checkout develop branch and merge version branch into develop branch
git checkout -b ${BRANCH_DEVELOP}
git merge ${BRANCH_MASTER} --no-ff --no-edit
#Push the changes in Develop Branch
git push origin ${BRANCH_DEVELOP}

