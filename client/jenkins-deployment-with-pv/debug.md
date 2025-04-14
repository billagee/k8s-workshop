Jenkins pod won't schedule when pv/pvc is enabled:

```
❯ k get pod
NAME                       READY   STATUS    RESTARTS   AGE
jenkins-85bfddcd79-p5js5   0/1     Pending   0          3m30s

❯ k describe pod
...
  Warning  FailedScheduling  2m54s  default-scheduler  0/1 nodes are available: persistentvolumeclaim "jenkins-pv-claim" not found. preemption: 0/1 nodes are available: 1 Preemption is not helpful for scheduling.
  Warning  FailedScheduling  2m52s  default-scheduler  0/1 nodes are available: 1 node(s) didn't find available persistent volumes to bind. preemption: 0/1 nodes are available: 1 Preemption is not helpful for scheduling.


sudo journalctl -u k3s

Apr 13 22:28:47 minik8s k3s[2137440]: E0413 22:28:47.096542 2137440 pv_controller.go:1587] "Error finding provisioning plugin for claim" err="storageclass.storage.k8s.io \"local-storage\" not found" PVC="user1/jenkins-pv-claim"
```


