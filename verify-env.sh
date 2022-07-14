#!/bin/bash
if [[ $TF_VAR_panoptica_access_key == "<access-key>" ]]; then echo "ACCESS KEY Not set!!!"; break; fi
if [[ $TF_VAR_panoptica_secret_key == "<secret-key>" ]]; then echo "SECRET KEY Not set!!!"; break; fi
if [[ $VAR_Username == "YOUR-EMAIL-Address" ]]; then echo "Your Email is Not set!!!"; break; else echo "Verification Successful! Please continue..." fi
