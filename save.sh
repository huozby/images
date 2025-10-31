#!/bin/bash
# 保存镜像为 tar 文件
IMAGES=(
  "docker.m.daocloud.io/busybox"
  "docker.m.daocloud.io/percona/fluentbit:4.0.1"
  "docker.m.daocloud.io/percona/haproxy:2.8.15"
  "docker.m.daocloud.io/percona/percona-xtrabackup:8.0.35-34.1"
  "docker.m.daocloud.io/percona/percona-xtradb-cluster:8.0.42-33.1"
  "docker.m.daocloud.io/percona/percona-xtradb-cluster-operator:0.3.0-backup"
  "docker.m.daocloud.io/percona/percona-xtradb-cluster-operator:1.18.0"
  "docker.m.daocloud.io/percona/pmm-client:3.3.1"
  "docker.m.daocloud.io/percona/proxysql2:2.7.3"
)

#for image in "${IMAGES[@]}"; do
#  echo "Saving $image"
#  filename=$(echo $image | sed 's|/|_|g' | sed 's|:|_|g').tar
#  docker save -o $filename $image
#done

# 打包所有镜像文件
#tar -czf percona-mysql-offline-images.tar.gz *.tar

docker save "${IMAGES[@]}" | gzip -9 > percona-offline-images.tar.gz
