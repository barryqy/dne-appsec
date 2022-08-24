#!/bin/bash
if [[ $VAR_Event != "Yes" ]]; then echo "You had indicated that this is not a proctored event, survey is not required, please continue"; exit 1; fi

echo "Please click on the following link to complete a quick survey"
echo "https://app.smartsheet.com/b/form/50e33d7cd4a0478b91cde887b043d336?CID="$DEVENV_USER
submit.sh 5 $VAR_Username $DEVENV_APP_8080_URL $DEVENV_INSTANCE_ID $DEVENV_USER
