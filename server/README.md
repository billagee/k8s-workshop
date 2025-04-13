On the host that you want multiple users to target with use kubectl, install k3s:

```
curl -sfL https://get.k3s.io | sh -
```

Get contents of `/etc/rancher/k3s/k3s.yaml`:

```
sudo cat /etc/rancher/k3s/k3s.yaml

# Or:

sudo k3s kubectl config view --raw
```

Create namespaces for your users:

```
kubectl create namespace user1
kubectl create namespace user2
```

On the users' workstations:

- If on Windows, install git for Windows if they don't have it, so git bash is available
- Install kubectl
- `touch ~/.kube/config.k8s.workshop && chmod 600 $_`
- Paste the k3s kubeconfig into `~/.kube/config.k8s.workshop`
- If not distributing the CA cert make sure each kubeconfig has:
```
  - cluster:
      insecure-skip-tls-verify: true
```
-  ...and you've deleted the certificate-authority-data line in the default cluster
- ...and you've set the remote server's hostname in the `server` line
- Set up bash completion and aliases:
```
source <(kubectl completion bash)
alias k='kubectl'
```
- `export KUBECONFIG=~/.kube/config.k8s.workshop`
- Try `k get ns` to see if you can see your cluster's namespaces
- Make sure each user sets the default context to their own namespace:
```
- context:
    cluster: default
    user: default
    namespace: user1        # 👈 Customize this line
  name: default
```
- Check that kubeconfig shows the correct custom namespace for the user:
```
❯ k config view
```

Try creating a pod in your namespace, and make sure it shows up in your ns, not the default ns:
```
❯ k run --image=nginx mynginx

❯ k -n user1 get pods
NAME      READY   STATUS    RESTARTS   AGE
mynginx   1/1     Running   0          19s

❯ k -n default get pods
No resources found in default namespace.
```

Now you're ready to move on to creating more complex configs or helm charts.
