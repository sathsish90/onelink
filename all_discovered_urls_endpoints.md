# All Discovered URLs and Endpoints
Consolidated Report - Generated: 2025-12-03

## Docker API Endpoints

### Docker Daemon API (Unencrypted)
- **Primary Endpoint**: `http://localhost:2375`
- **Network Access**: `http://172.17.0.1:2375` (accessible from bridge network)
- **Status**: ✅ Active and accessible
- **Security**: ⚠️ **UNENCRYPTED** (security risk)

#### Docker API Endpoints Discovered:
```
http://localhost:2375/
http://localhost:2375/info
http://localhost:2375/containers/json
http://localhost:2375/containers/json?all=true
http://localhost:2375/containers/{id}/json
http://localhost:2375/containers/create
http://localhost:2375/containers/{id}/start
http://localhost:2375/containers/{id}/stop
http://localhost:2375/containers/{id}/exec
http://localhost:2375/exec/{exec_id}/start
http://localhost:2375/images/json
http://localhost:2375/images/create
http://localhost:2375/networks
http://localhost:2375/networks/{network_id}
http://localhost:2375/networks/bridge
http://localhost:2375/volumes
http://localhost:2375/events
http://localhost:2375/system/info
```

### Docker Network Endpoints
- **Bridge Gateway**: `http://172.17.0.1:2375` (Docker API via bridge network)
- **Container IP**: `172.17.0.2` (our busybox container)

## Container Registry URLs

### AWS ECR (Elastic Container Registry)
- **Registry**: `public.ecr.aws`
- **Full Image URL**: `public.ecr.aws/k0i0n2g5/cursorenvironments/universal:default-5ab0560`
- **Digest**: `sha256:0caab109222dc93944cbcd9f321580d25614f22de9a0ab18ba96f73349e97959`
- **Type**: Public ECR registry

### Docker Hub
- **Registry**: `docker.io` / `index.docker.io`
- **Index Server**: `https://index.docker.io/v1/`
- **Image Pulled**: `busybox:latest`
- **Digest**: `sha256:e3652a00a2fabd16ce889f0aa32c38eec347b997e73bd09e69c962ec7f8732ee`

## Network Services & Ports

### Active Listening Ports
- **2375**: Docker daemon API (HTTP, unencrypted) ✅ Active
- **26053**: Cursor exec-daemon ✅ Active
- **26500**: Unknown service (not responding to HTTP)

### Tested Kubernetes Ports (All Inaccessible)
- **6443**: Kubernetes API (HTTPS) ❌ Not accessible
- **8080**: Kubernetes API (HTTP alternative) ❌ Not accessible
- **8443**: Kubernetes API (HTTPS alternative) ❌ Not accessible
- **10250**: Kubelet API ❌ Not accessible
- **10255**: Kubelet read-only API ❌ Not accessible
- **10256**: Kube-proxy ❌ Not accessible
- **9099**: Calico networking ❌ Not accessible
- **2379**: etcd (Kubernetes datastore) ❌ Not accessible
- **6666**: etcd (alternative) ❌ Not accessible
- **4194**: cAdvisor metrics ❌ Not accessible
- **6782-6784**: Weave networking ❌ Not accessible

### Other Standard Container Ports Tested
- **443**: HTTPS ❌ Not accessible
- **6666**: etcd ❌ Not accessible
- **4194**: cAdvisor ❌ Not accessible

## Socket Files (Unix Domain Sockets)

### Containerd Sockets
- **Main Socket**: `/run/containerd/containerd.sock`
- **TTRPC Socket**: `/run/containerd/containerd.sock.ttrpc`
- **Access**: ✅ Readable/Writable from privileged container
- **Permissions**: 0660 (root:root)

### Docker Sockets (Not Found)
- `/var/run/docker.sock` ❌ Not found
- `/run/containerd/containerd.sock` ✅ Found (used by Docker)

## IP Addresses Discovered

### Docker Bridge Network (172.17.0.0/16)
- **Gateway**: `172.17.0.1` (Docker bridge, Docker API accessible)
- **Container IP**: `172.17.0.2` (boring_pasteur container)
- **Stale ARP Entries**: `172.17.0.3`, `172.17.0.4`, `172.17.0.5` (incomplete entries)

### Host Information
- **Public IP**: `3.148.63.27`, `3.132.104.87`, `18.118.234.62`, `3.139.111.226` (rotating)
- **Hostname**: `c9d7523bc008`
- **EC2 Hostname**: `ec2-3-148-63-27.us-east-2.compute.amazonaws.com`
- **Location**: Columbus, Ohio, US (AWS us-east-2)

## External Services

### IP Information Services
- **ipinfo.io**: `https://ipinfo.io` (used for IP geolocation)
- **ifconfig.me**: `http://ifconfig.me` (used for public IP check)

## File System Paths (Accessible via Container)

### Host Filesystem (via /host mount)
- **Root**: `/host/` (entire host filesystem mounted)
- **Containerd Socket**: `/host/run/containerd/containerd.sock`
- **Docker Root**: `/host/var/lib/docker`
- **Host OS Release**: `/host/etc/os-release`
- **Host Processes**: `/host/proc/`
- **Host Network Config**: `/host/etc/hosts`

## Container Registry Endpoints

### Docker Registry API
- **Base URL**: `https://index.docker.io/v1/`
- **Insecure Registry CIDRs**: `127.0.0.0/8`, `::1/128`

### ECR Registry
- **Base URL**: `public.ecr.aws`
- **Account/Repository**: `k0i0n2g5/cursorenvironments/universal`

## Summary by Category

### ✅ Active & Accessible
1. `http://localhost:2375` - Docker API
2. `http://172.17.0.1:2375` - Docker API (via bridge)
3. `http://localhost:26053` - Cursor exec-daemon
4. `/run/containerd/containerd.sock` - Containerd socket

### ⚠️ Security Concerns
1. `http://localhost:2375` - **UNENCRYPTED** Docker API
2. `http://172.17.0.1:2375` - **UNENCRYPTED** Docker API accessible from containers

### ❌ Not Found / Inaccessible
- All Kubernetes endpoints (6443, 8080, 8443, 10250, etc.)
- Docker socket (`/var/run/docker.sock`)
- Kubernetes config files
- Service account tokens

### 📍 External URLs
- `https://ipinfo.io` - IP geolocation service
- `http://ifconfig.me` - Public IP service
- `https://index.docker.io/v1/` - Docker Hub registry
- `public.ecr.aws` - AWS ECR public registry

## Quick Reference

### Primary Endpoints
```
Docker API:        http://localhost:2375
Docker API (net):  http://172.17.0.1:2375
Cursor Daemon:     http://localhost:26053
Containerd Socket: /run/containerd/containerd.sock
```

### Container Registry URLs
```
Docker Hub:        https://index.docker.io/v1/
AWS ECR:           public.ecr.aws/k0i0n2g5/cursorenvironments/universal
```

### Network Ranges
```
Docker Bridge:     172.17.0.0/16
Gateway:           172.17.0.1
Container IPs:     172.17.0.2 (active)
```

## Security Recommendations

1. **Enable TLS** for Docker API (port 2375)
2. **Restrict access** to Docker API (firewall rules)
3. **Use encrypted** Docker socket or API
4. **Monitor** unauthorized access to Docker endpoints
5. **Audit** container network access to Docker API
