Note the pv dir in this example requires k3s to be able to write to the /mnt/jenkins dir on the node:

```
sudo mkdir /mnt/jenkins
sudo chown 1000:1000 jenkins/
sudo chmod 755 jenkins/
```
