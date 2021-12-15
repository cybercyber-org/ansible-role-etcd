Run `vagrant up`.
See the cluster running with `vagrant ssh node0 -c 'ETCDCTL_API=3 etcdctl
member list --endpoints=https://127.0.0.1:2379 --cacert=/etc/etcd/ca.pem
--cert=/etc/etcd/kubernetes.pem --key=/etc/etcd/kubernetes-key.pem'`.

Increment `N` in Vagrantfile.
Run `vagrant up`.
See the cluster getting bigger with `vagrant ssh node0 -c 'ETCDCTL_API=3
etcdctl member list --endpoints=https://127.0.0.1:2379
--cacert=/etc/etcd/ca.pem --cert=/etc/etcd/kubernetes.pem
--key=/etc/etcd/kubernetes-key.pem'`.

Warning: only add one node at a time!
