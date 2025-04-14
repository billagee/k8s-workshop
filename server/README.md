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

Create `~/.kube/config.k8s.workshop` on the server and paste in the k3s.yaml contents.

Then prepare the kubeconfig file for use by users on remote workstations:

```
1. Make sure the remote server's hostname is in the `server` line
2. If not distributing the k8s CA cert, make sure each kubeconfig has:
  - cluster:
      insecure-skip-tls-verify: true

... and that the certificate-authority-data line in the default cluster is removed.
```

Create namespaces for your users:

```
kubectl create namespace user1
kubectl create namespace user2
```

On the users' workstations:

- If on Windows, install git for Windows if they don't have it, so git bash is available
- Install kubectl
- `mkdir ~/.kube && touch ~/.kube/config.k8s.workshop && chmod 600 $_`
- Paste the k3s kubeconfig into `~/.kube/config.k8s.workshop`
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
