Ansible role to install etcd and configure a cluster.

This is highly customized for [our kubernetes project](https://cybercyber.org/kubernetes-i-motivation-network-setup-and-installing-kubernetes.html).

Install using `ansible-galaxy install cybercyber_org.etcd`.

Uses these variables:

```yaml
etcd: true          # only nodes with this set will be added to the cluster.
                    # ideally, run this role using { role: cybercyber_org.etcd, when: etcd }
interface: eth0     # the interface over which the rest of the cluster is reachable
etcd_version: 3.5.1 # The version of etcd to install
vg: lvm             # The name of the LVM VG to use to create storage
```
