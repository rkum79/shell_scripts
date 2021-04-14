#!/bin/bash -xv
#######################################################################################
# This script is to check SNAPSHOT Availability and remove it from Master branch      #
# Author : Rajiv Kumar                                                                #
# Reviewed By: DevOps Team                                                            #
#######################################################################################
SVERSION=`xml2 < pom.xml  | grep /project/version= | sed 's/.*=//'`
major=$(echo $SVERSION | cut -c1)
var2=$(echo $SVERSION | cut -c2)
miner=$(echo $SVERSION | cut -c3)
var4=$(echo $SVERSION | cut -c4)
bug=$(echo $SVERSION | cut -c5)

versionLabel=$major$var2$miner$var4$bug
echo Current Version Name: $SVERSION
echo Updated Version: $versionLabel

BRANCH_NAME=${GITHUB_REF_NAME}
VERSION=$(mvn -Dexec.executable='echo' -Dexec.args='${project.version}' --non-recursive exec:exec -q |egrep -iwo SNAPSHOT)
LN=$(grep -n "<version>" pom.xml | head -1 | awk -F ":" '{print $1}')
MergeCommit=`git log -1 |egrep -iwo Merge | tail -1`

if [ "${BRANCH_NAME}" = "main" ];
  then
    if [ "${VERSION}" = "SNAPSHOT" ];
    then
       echo Please remove the SNAPSHOT from pom.xml file from vresion in ${BRANCH_NAME} Branch
       if [ "${MergeCommit}" = "Merge" ];
        then
          echo This is Merge Commit Updating the pom Version
          sed -i "$LN s/$SVERSION/$versionLabel/" pom.xml
          git config --global user.email "rajiv_kumar@waters.com"
          git config --global user.name "conrkuma"
          git commit -a -m 'AutoCommit remove SNAPSHOT from pom.xml'
          git remote add central ${bamboo_planRepository_repositoryUrl}
          git push central ${GITHUB_REF_NAME}
          ls -ltr
          echo "The SNAPSHOT Version was available in master. We have removed it from master branch. aborting the build & auto trigger the build again"
          exit 1
        else
          echo Please update the pom.xml file with SNAPSHOT in the version in ${BRANCH_NAME} Branch
          ls -ltr
          exit 1
        fi
    else
     echo We don not have the SNAPSHOT in this ${BRANCH_NAME} Branch. Proceeding for the build creation
     ls -ltr
    fi
  else
    if [ "${VERSION}" = "SNAPSHOT" ];
     then
      echo We have the SNAPSHOT in this ${BRANCH_NAME} Branch. Proceeding for the build creation
      ls -ltr
     else
      echo Please update the pom.xml file with SNAPSHOT in the version in ${BRANCH_NAME} Branch
      ls -ltr
      exit 1
    fi
fi
