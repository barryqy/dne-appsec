#!/bin/bash
regex="^[a-z0-9!#\$%&'*+/=?^_\`{|}~-]+(\.[a-z0-9!#$%&'*+/=?^_\`{|}~-]+)*@([a-z0-9]([a-z0-9-]*[a-z0-9])?\.)+[a-z0-9]([a-z0-9-]*[a-z0-9])?\$"
if [[ -z $TF_VAR_panoptica_access_key ]]||[[ $TF_VAR_panoptica_access_key == "<access-key>" ]]; then echo "ACCESS KEY Not set!!!"; exit 1; fi
if [[ -z $TF_VAR_panoptica_secret_key ]]||[[ $TF_VAR_panoptica_secret_key == "<secret-key>" ]]; then echo "SECRET KEY Not set!!!"; exit 1; fi
if [[ $VAR_Username == "YOUR-EMAIL-Address" ]]&&[[ $VAR_Event == "Yes" ]]; then echo "Your Email is Not set!!!"; exit 1; fi
if [[ $VAR_Event != "Yes" ]]; then echo "Verification done. Please continue..."; fi
if [[ $VAR_Username =~ $regex ]]&&[[ $VAR_Event == "Yes" ]]; then echo "Verification Successful! Please continue..."; else echo "Note: If you're attending Panoptica Workshop, please provide a valid email address"; fi
