echo "export TF_VAR_environment_name=devnet_express" >> /home/developer/.bashrc
echo "export TF_VAR_kubernetes_cluster_context_name=kind-devnet" >> /home/developer/.bashrc

### 7. Replace `<access-key>` with your Access Key. Copy and paste from step1 above. Remove the <>!
echo "export TF_VAR_panoptica_access_key=<access-key>" >> /home/developer/.bashrc

### 8. Replace `<secret-key>` with your Access Key. Copy and paste from step1 above. Remove the <>!
echo "export TF_VAR_panoptica_secret_key=<secret-key>" >> /home/developer/.bashrc

### 9. Are you attending a proctored event?
echo "export VAR_Event=Yes" >> /home/developer/.bashrc

#### If Yes, provide your email for claiming swags! (with quotes)
echo "export VAR_Username='YOUR-EMAIL@Address'" >> /home/developer/.bashrc

source /home/developer/.bashrc
