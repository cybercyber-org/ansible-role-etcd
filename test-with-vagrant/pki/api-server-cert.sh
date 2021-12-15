#!/bin/bash -eu

KUBERNETES_HOSTNAMES=kubernetes,kubernetes.default,kubernetes.default.svc,kubernetes.default.svc.cluster,kubernetes.default.svc.cluster.local
INTERNAL_HOSTNAMES=node0,node1,node2,node3
KUBERNETES_IPS=192.168.56.200,192.168.56.201,192.168.56.202,192.168.56.203

cat > kubernetes-csr.json <<EOF
{
  "CN": "kubernetes",
  "key": {
    "algo": "rsa",
    "size": 2048
  },
  "names": [
    {
      "C": "DE",
      "L": "Cloud",
      "O": "Kubernetes",
      "OU": "Cloud",
      "ST": "Cloud"
    }
  ]
}
EOF

cfssl gencert \
    -ca=ca.pem \
    -ca-key=ca-key.pem \
    -config=ca-config.json \
    -hostname=10.32.0.1,${KUBERNETES_IPS},127.0.0.1,${KUBERNETES_HOSTNAMES},${INTERNAL_HOSTNAMES} \
    -profile=kubernetes \
    kubernetes-csr.json | cfssljson -bare kubernetes
