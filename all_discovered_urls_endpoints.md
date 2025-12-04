# Consolidated List of All Discovered URLs and Endpoints
Generated: 2025-12-03

## Docker API Endpoints

### Docker Daemon API (Unencrypted)
- **Primary Endpoint**: `http://localhost:2375`
- **Gateway Endpoint**: `http://172.17.0.1:2375` (accessible from bridge network)
- **Status**: ✅ Active and accessible
- **Security**: ⚠️ Unencrypted (security risk)

### Docker API Endpoints Used
- `http://localhost:2375/containers/json?all=true` - List all containers
- `http://localhost:2375/containers/json` - List running containers
- `http://localhost:2375/images/json` - List images
- `http://localhost:2375/info` - Docker system information
- `http://localhost:2375/events` - Docker events stream
- `http://localhost:2375/networks` - List Docker networks
- `http://localhost:2375/networks/bridge` - Bridge network details
- `http://localhost:2375/volumes` - List Docker volumes
- `http://localhost:2375/containers/{id}/json` - Container details
- `http://localhost:2375/containers/create` - Create container
- `http://localhost:2375/containers/{id}/start` - Start container
- `http://localhost:2375/containers/{id}/exec` - Create exec instance
- `http://localhost:2375/exec/{id}/start` - Start exec instance

## Network IP Addresses

### Docker Bridge Network (172.17.0.0/16)
- **Gateway**: `172.17.0.1` (Docker bridge gateway)
- **Container IPs**:
  - `172.17.0.2` - busybox container (boring_pasteur) - Active
  - `172.17.0.3` - Stale ARP entry (inactive)
  - `172.17.0.4` - Stale ARP entry (inactive)
  - `172.17.0.5` - Stale ARP entry (inactive)

### Host Network
- **Hostname**: `c9d7523bc008`
- **Public IP**: Rotating between:
  - `3.148.63.27`
  - `3.132.104.87`
  - `18.118.234.62`
  - `3.139.111.226`
- **Hostname**: `ec2-3-148-63-27.us-east-2.compute.amazonaws.com`

## Container Registry URLs

### AWS ECR (Elastic Container Registry)
- **Registry**: `public.ecr.aws`
- **Full Image URL**: `public.ecr.aws/k0i0n2g5/cursorenvironments/universal:default-5ab0560`
- **Digest**: `sha256:0caab109222dc93944cbcd9f321580d25614f22de9a0ab18ba96f73349e97959`
- **Status**: ✅ Used by Cursor environment container

### Docker Hub
- **Registry**: `docker.io` / `index.docker.io`
- **Index Server**: `https://index.docker.io/v1/`
- **Image Used**: `busybox:latest`
- **Digest**: `sha256:e3652a00a2fabd16ce889f0aa32c38eec347b997e73bd09e69c962ec7f8732ee`
- **Status**: ✅ Used for busybox containers

## Service Endpoints (Tested)

### Listening Ports
- **Port 2375**: Docker daemon API (HTTP) - ✅ Active
- **Port 26053**: Cursor exec-daemon - ✅ Active
- **Port 26500**: Unknown service - ❌ Not responding to HTTP

### Kubernetes Ports (Tested - All Inaccessible)
- **Port 6443**: Kubernetes API (HTTPS) - ❌ Not accessible
- **Port 8080**: Kubernetes API (HTTP) - ❌ Not accessible
- **Port 8443**: Kubernetes API (HTTPS alternative) - ❌ Not accessible
- **Port 10250**: Kubelet API - ❌ Not accessible
- **Port 10255**: Kubelet read-only API - ❌ Not accessible
- **Port 10256**: Kube-proxy metrics - ❌ Not accessible
- **Port 9099**: Calico networking - ❌ Not accessible
- **Port 2379**: etcd API - ❌ Not accessible
- **Port 6666**: etcd alternative - ❌ Not accessible
- **Port 4194**: cAdvisor metrics - ❌ Not accessible
- **Ports 6782-6784**: Weave networking - ❌ Not accessible

### Other Standard Ports
- **Port 443**: HTTPS - Not tested
- **Port 6666**: etcd - Not accessible
- **Port 4194**: cAdvisor - Not accessible

## External API Endpoints

### IP Information Services
- **ipinfo.io**: `https://ipinfo.io` - ✅ Accessible
  - Returns: IP, hostname, location, organization
- **ifconfig.me**: `http://ifconfig.me` - ✅ Accessible
  - Returns: Public IP address

## Socket Paths (Not URLs, but Endpoints)

### Containerd Sockets
- **Main Socket**: `/run/containerd/containerd.sock`
- **TTRPC Socket**: `/run/containerd/containerd.sock.ttrpc`
- **Status**: ✅ Accessible from privileged container via `/host` mount

### Docker Sockets (Not Found)
- `/var/run/docker.sock` - ❌ Not found
- `/run/containerd/containerd.sock` - ✅ Found (used by Docker)

## Container IDs and Exec IDs

### Active Containers
- **Cursor Container**: `71fd15a086dc1a7bf67cf84d079bb3b0f0555cc2c4c536e0d2a413ea9fbe6bfe`
- **Busybox Container**: `7f764d3a9d4287b38959f9470bb739d4b65eb179ff881314d1a62c62f071820a`
- **Stopped Container**: `ff0b8c2c8e97b3c8e972d7c53bde706a8439947f15f67f2245365da54777f923`

### Exec Instances Created
- `cfd5b158fb9e2ec653259c19c251be3b34f2a041f4f1daf4be773804811b50ae`
- `6b2f539f7e8760d4086bdef6dd4b1a9de3488436a5a8b8733c8ebc6cd09e4819`
- `e4f513fb73dfce214c52f2463b34eca314ece7c0338c2d6ecc1eff92b868c194`

## Network URLs

### Docker Networks
- **Bridge Network ID**: `bb9f8916985ccc2d8328eb7aa3e933fc042f3b48cc2e869d966e29c0d0db3e6d`
- **Host Network ID**: `ff01284d0b57487a2b6ddfa2312529051e39b7f63c969f5e982d82a8d293385f`
- **None Network ID**: `09a5d64dcef9c184b3aa4f3d4eea11fecc8089601d1cf9648a48a53711c9a346`

## GitHub Repository

### Cloned Repository
- **URL**: `https://github.com/cyberark/kubernetes-rbac-audit.git`
- **Status**: ✅ Cloned to `/workspace/kubernetes-rbac-audit`

## Summary by Category

### ✅ Active and Accessible
1. `http://localhost:2375` - Docker API
2. `http://172.17.0.1:2375` - Docker API via gateway
3. `http://localhost:26053` - Cursor exec-daemon
4. `https://ipinfo.io` - IP information service
5. `http://ifconfig.me` - IP information service
6. `public.ecr.aws` - AWS ECR registry
7. `docker.io` / `index.docker.io` - Docker Hub registry

### ❌ Not Accessible / Not Found
1. Kubernetes API endpoints (all ports)
2. `/var/run/docker.sock` socket
3. Kubernetes config files
4. Port 26500 HTTP service

### ⚠️ Security Concerns
1. `http://localhost:2375` - Unencrypted Docker API
2. `http://172.17.0.1:2375` - Docker API accessible from containers
3. Containerd socket accessible via privileged container

## Quick Reference

### Most Important URLs
```
Docker API:        http://localhost:2375
Docker Gateway:    http://172.17.0.1:2375
Cursor Daemon:     http://localhost:26053
AWS ECR:           public.ecr.aws
Docker Hub:        docker.io
IP Info:           https://ipinfo.io
```

### Network Ranges
```
Docker Bridge:     172.17.0.0/16
Gateway:           172.17.0.1
Container IPs:     172.17.0.2-5
Public IPs:         3.x.x.x, 18.x.x.x (AWS us-east-2)
```

### Key Endpoints for Testing
```
# List containers
curl http://localhost:2375/containers/json

# Docker info
curl http://localhost:2375/info

# List images
curl http://localhost:2375/images/json

# List networks
curl http://localhost:2375/networks

# Public IP
curl http://ifconfig.me
```
