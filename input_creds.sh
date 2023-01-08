#!/bin/bash
echo "Enter your vSphere creds:"
echo "-------------------------"
echo -n "Username: "
read username
echo -n "Password: "
read -s password
echo "Enter your Active Directory creds:"
echo "----------------------------------"
echo -n "AD username: "
read ad_username
echo -n "AD password: "
read -s ad_password
export TF_VAR_password=$password
export TF_VAR_username=$username
export ANS_VAR_password=$ad_password
export ANS_VAR_username=$ad_username
