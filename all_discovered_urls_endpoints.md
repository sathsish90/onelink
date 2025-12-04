# All Discovered URLs and Endpoints
Generated: 2025-12-03

## Docker API Endpoints

### Docker Daemon API (Unencrypted)
- **Primary Endpoint**: `http://localhost:2375`
- **Alternative Gateway Access**: `http://172.17.0.1:2375` (from bridge network)
- **Status**: ✅ Accessible
- **Security**: ⚠️ Unencrypted (security risk)

### Docker API Endpoints Used
- `http://localhost:2375/containers/json` - List containers
- `http://localhost:2375/containers/json?all=true` - List all containers (including stopped)
- `http://localhost:2375/containers/{id}/json` - Container details
- `http://localhost:2375/containers/create` - Create container
- `http://localhost:2375/containers/{id}/start` - Start container
- `http://localhost:2375/containers/{id}/stop` - Stop container
- `http://localhost:2375/containers/{id}/exec` - Create exec instance
- `http://localhost:2375/exec/{exec_id}/start` - Start exec instance
- `http://localhost:2375/images/json` - List images
- `http://localhost:2375/images/create` - Pull image
- `http://localhost:2375/info` - Docker system information
- `http://localhost:2375/events` - Docker events stream
- `http://localhost:2375/networks` - List networks
- `http://localhost:2375/networks/{network_id}` - Network details
- `http://localhost:2375/volumes` - List volumes

## Container Registry URLs

### AWS ECR (Elastic Container Registry)
- **Registry**: `public.ecr.aws`
- **Full Image URL**: `public.ecr.aws/k0i0n2g5/cursorenvironments/universal:default-5ab0560`
- **Digest**: `sha256:0caab109222dc93944cbcd9f321580d25614f22de9a0ab18ba96f73349e97959`
- **Status**: ✅ Used (Cursor environment image)

### Docker Hub
- **Registry**: `docker.io` / `index.docker.io`
- **Index Server**: `https://index.docker.io/v1/`
- **Image Pulled**: `busybox:latest`
- **Digest**: `sha256:e3652a00a2fabd16ce889f0aa32c38eec347b997e73bd09e69c962ec7f8732ee`
- **Status**: ✅ Used

## Network Services & Ports

### Listening Services
- **Port 2375**: Docker daemon API (HTTP, unencrypted)
  - `http://localhost:2375`
  - `http://172.17.0.1:2375` (gateway access)
  - Status: ✅ Active

- **Port 26053**: Cursor exec-daemon
  - `http://localhost:26053`
  - Status: ✅ Active (from process list)

- **Port 26500**: Unknown service
  - `http://localhost:26500`
  - Status: ⚠️ Listening but not responding to HTTP

### Kubernetes Ports (Checked - Not Accessible)
- **Port 6443**: Kubernetes API server (HTTPS)
  - `https://localhost:6443`
  - Status: ❌ Not accessible

- **Port 8080**: Kubernetes API server (HTTP alternative)
  - `http://localhost:8080`
  - Status: ❌ Not accessible

- **Port 8443**: Kubernetes API server (HTTPS alternative)
  - `https://localhost:8443`
  - Status: ❌ Not accessible

- **Port 10250**: Kubelet API
  - `http://localhost:10250`
  - Status: ❌ Not accessible

- **Port 10255**: Kubelet read-only API
  - `http://localhost:10255`
  - Status: ❌ Not accessible

- **Port 10256**: Kube-proxy metrics
  - `http://localhost:10256`
  - Status: ❌ Not accessible

- **Port 9099**: Calico networking
  - `http://localhost:9099`
  - Status: ❌ Not accessible

- **Port 2379**: etcd (Kubernetes datastore)
  - `http://localhost:2379`
  - Status: ❌ Not accessible

- **Port 6666**: etcd (alternative)
  - `http://localhost:6666`
  - Status: ❌ Not accessible

- **Port 4194**: cAdvisor (container metrics)
  - `http://localhost:4194`
  - Status: ❌ Not accessible

- **Ports 6782-6784**: Weave networking
  - `http://localhost:6782`
  - `http://localhost:6783`
  - `http://localhost:6784`
  - Status: ❌ Not accessible

### Other Kubernetes-Related Ports (Not Checked)
- **Port 30000-32767**: NodePort service range
- **Port 44134**: Unknown Kubernetes service

## External IP Addresses

### Public IP Addresses (Rotating)
- **IP 1**: `3.148.63.27` (first check)
- **IP 2**: `3.132.104.87` (second check)
- **IP 3**: `18.118.234.62` (third check)
- **IP 4**: `3.139.111.226` (fourth check)
- **Provider**: AWS (Amazon Web Services)
- **Region**: us-east-2 (Ohio)
- **Hostname Pattern**: `ec2-*-us-east-2.compute.amazonaws.com`
- **Service**: `ifconfig.me` (IP detection service)
- **Service**: `ipinfo.io` (IP geolocation service)

## Internal Network Addresses

### Docker Bridge Network
- **Subnet**: `172.17.0.0/16`
- **Gateway**: `172.17.0.1`
- **Container IPs**:
  - `172.17.0.2` - busybox container (boring_pasteur)
  - `172.17.0.3` - Stale ARP entry
  - `172.17.0.4` - Stale ARP entry
  - `172.17.0.5` - Stale ARP entry

### Host Network
- **Hostname**: `c9d7523bc008`
- **Hostname Mapping**: `172.17.0.2` → `c9d7523bc008` (in /etc/hosts)

## Socket Files (Unix Domain Sockets)

### Containerd Sockets
- `/run/containerd/containerd.sock` - Main containerd socket
- `/run/containerd/containerd.sock.ttrpc` - TTRPC API socket
- **Access**: Root user can read/write (via bind mount)

### Docker Socket
- `/var/run/docker.sock` - ❌ Not found (not mounted)
- **Note**: Docker API accessible via HTTP on port 2375 instead

## File System Paths (Accessible via Bind Mount)

### Host Filesystem Access
- **Mount Point**: `/host` (in container)
- **Source**: `/` (host root filesystem)
- **Access**: Full read/write access from privileged container

### Key Paths Accessed
- `/host/etc/os-release` - OS information
- `/host/etc/hosts` - Hostname mappings
- `/host/run/containerd/containerd.sock` - Containerd socket
- `/host/var/lib/docker/` - Docker data directory
- `/host/proc/` - Process information
- `/host/sys/` - System information

## GitHub Repository

### Cloned Repository
- **Repository**: `https://github.com/cyberark/kubernetes-rbac-audit.git`
- **Location**: `/workspace/kubernetes-rbac-audit/`
- **Purpose**: Kubernetes RBAC auditing tool

## Summary by Category

### ✅ Active & Accessible
1. `http://localhost:2375` - Docker API
2. `http://172.17.0.1:2375` - Docker API (gateway)
3. `http://localhost:26053` - Cursor exec-daemon
4. `public.ecr.aws` - AWS ECR registry
5. `https://index.docker.io/v1/` - Docker Hub registry
6. `https://ipinfo.io` - IP geolocation API
7. `http://ifconfig.me` - IP detection service

### ⚠️ Listening but Not Responding
1. `http://localhost:26500` - Unknown service

### ❌ Not Accessible (Kubernetes Ports)
1. `https://localhost:6443` - Kubernetes API
2. `http://localhost:8080` - Kubernetes API alt
3. `http://localhost:10250` - Kubelet API
4. `http://localhost:10255` - Kubelet read-only
5. `http://localhost:2379` - etcd
6. All other Kubernetes-related ports

### 🔒 Socket Files
1. `/run/containerd/containerd.sock` - Containerd (accessible)
2. `/run/containerd/containerd.sock.ttrpc` - Containerd TTRPC

## Security Notes

### High Risk
- **Unencrypted Docker API** on port 2375
  - Accessible from network
  - No authentication required
  - Allows full container control

### Medium Risk
- **Containerd socket** accessible via bind mount
  - Root containers can access
  - Allows containerd control

### Low Risk
- **External IP rotation** (NAT gateway)
  - Multiple outbound IPs
  - Normal AWS behavior

## Quick Reference

### Most Important URLs
```
Docker API:        http://localhost:2375
Docker Gateway:    http://172.17.0.1:2375
Cursor Daemon:     http://localhost:26053
AWS ECR:           public.ecr.aws
Docker Hub:        https://index.docker.io/v1/
IP Info:           https://ipinfo.io
```

### Network Ranges
```
Docker Bridge:     172.17.0.0/16
Gateway:           172.17.0.1
Container:         172.17.0.2
Public IPs:        3.x.x.x, 18.x.x.x (AWS us-east-2)
```
