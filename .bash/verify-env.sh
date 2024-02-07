#!/bin/bash
if [[ -z $TF_VAR_panoptica_access_key ]]||[[ $TF_VAR_panoptica_access_key == "access-key" ]]; then echo "ACCESS KEY Not set!!!"; exit 1; fi
if [[ -z $TF_VAR_panoptica_secret_key ]]||[[ $TF_VAR_panoptica_secret_key == "secret-key" ]]; then echo "SECRET KEY Not set!!!"; exit 1; fi
echo "Verification Successful! Please continue..."