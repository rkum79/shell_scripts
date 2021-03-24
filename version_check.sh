#!/bin/bash
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

BRANCH_NAME=${GITHUB_REF}
VERSION=$(mvn -Dexec.executable='echo' -Dexec.args='${project.version}' --non-recursive exec:exec -q |egrep -iwo SNAPSHOT)
LN=$(grep -n "<version>" pom.xml | head -1 | awk -F ":" '{print $1}')
MergeCommit=`git log -1 |egrep -iwo Merge | tail -1`

if [ "${BRANCH_NAME}" = "refs/heads/master" ];
  then
    if [ "${VERSION}" = "SNAPSHOT" ];
    then
       echo Please remove the SNAPSHOT from pom.xml file from vresion in ${BRANCH_NAME} Branch
       if [ "${MergeCommit}" = "Merge" ];
        then
          echo This is Merge Commit Updating the pom Version
          sed -i "$LN s/$SVERSION/$versionLabel/" pom.xml
          git config --global user.email "sendmailrajiv@gmail.com"
          git config --global user.name "rkum79"
          git commit -a -m 'AutoCommit remove SNAPSHOT from pom.xml'
          git push ${BRANCH_NAME}
          ls -ltr
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

