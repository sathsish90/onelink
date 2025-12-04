# All Discovered URLs and Endpoints
Generated: 2025-12-03

## Docker API Endpoints

### Docker Daemon API (Unencrypted)
- **Primary Endpoint**: `http://localhost:2375`
- **Gateway Access**: `http://172.17.0.1:2375` (accessible from bridge network containers)
- **Status**: ✅ Active and accessible
- **Security**: ⚠️ Unencrypted (security risk)

### Docker API Endpoints Tested
- `http://localhost:2375/info` - System information
- `http://localhost:2375/containers/json` - List containers
- `http://localhost:2375/containers/json?all=true` - List all containers (including stopped)
- `http://localhost:2375/images/json` - List images
- `http://localhost:2375/networks` - List networks
- `http://localhost:2375/networks/bridge` - Bridge network details
- `http://localhost:2375/volumes` - List volumes
- `http://localhost:2375/containers/{id}/json` - Container details
- `http://localhost:2375/containers/create` - Create container
- `http://localhost:2375/containers/{id}/start` - Start container
- `http://localhost:2375/containers/{id}/exec` - Create exec instance
- `http://localhost:2375/exec/{id}/start` - Start exec instance
- `http://localhost:2375/events` - Docker events stream
- `http://localhost:2375/images/create` - Pull image

## Network Services

### Listening Ports
- **Port 2375**: Docker daemon API (HTTP, unencrypted)
  - `http://localhost:2375`
  - `http://172.17.0.1:2375` (from bridge network)
  
- **Port 26053**: Cursor exec-daemon
  - `http://localhost:26053`
  - Status: ✅ Active (IPv6)
  
- **Port 26500**: Unknown service
  - `http://localhost:26500`
  - Status: ❌ Not responding to HTTP

### Kubernetes Ports (Checked - Not Accessible)
- **Port 6443**: Kubernetes API (HTTPS)
  - `https://localhost:6443` - ❌ Not accessible
  - `http://localhost:6443` - ❌ Not accessible
  
- **Port 8080**: Kubernetes API (HTTP alternative)
  - `http://localhost:8080` - ❌ Not accessible
  
- **Port 8443**: Kubernetes API (HTTPS alternative)
  - `https://localhost:8443` - ❌ Not accessible
  
- **Port 10250**: Kubelet API
  - `http://localhost:10250` - ❌ Not accessible
  
- **Port 10255**: Kubelet read-only API
  - `http://localhost:10255` - ❌ Not accessible
  
- **Port 10256**: Kube-proxy
  - `http://localhost:10256` - ❌ Not accessible
  
- **Port 9099**: Calico
  - `http://localhost:9099` - ❌ Not accessible
  
- **Port 2379**: etcd
  - `http://localhost:2379` - ❌ Not accessible
  
- **Port 6666**: etcd
  - `http://localhost:6666` - ❌ Not accessible
  
- **Port 4194**: cAdvisor
  - `http://localhost:4194` - ❌ Not accessible
  
- **Ports 6782-6784**: Weave
  - `http://localhost:6782` - ❌ Not accessible
  - `http://localhost:6783` - ❌ Not accessible
  - `http://localhost:6784` - ❌ Not accessible

## Container Registry URLs

### AWS ECR (Elastic Container Registry)
- **Registry**: `public.ecr.aws`
- **Image**: `public.ecr.aws/k0i0n2g5/cursorenvironments/universal:default-5ab0560`
- **Digest**: `sha256:0caab109222dc93944cbcd9f321580d25614f22de9a0ab18ba96f73349e97959`
- **Full URL**: `https://public.ecr.aws/k0i0n2g5/cursorenvironments/universal:default-5ab0560`

### Docker Hub
- **Registry**: `docker.io` / `index.docker.io`
- **Image**: `busybox:latest`
- **Digest**: `sha256:e3652a00a2fabd16ce889f0aa32c38eec347b997e73bd09e69c962ec7f8732ee`
- **Full URL**: `https://index.docker.io/v1/`
- **Image URL**: `https://hub.docker.com/_/busybox`

## External API Endpoints (Tested)

### IP Information Services
- **ipinfo.io**: `http://ipinfo.io`
  - Used to get public IP and location information
  - Result: IP `3.148.63.27` (rotating), Columbus, Ohio, US
  
- **ifconfig.me**: `http://ifconfig.me`
  - Used to get public IP address
  - Result: Rotating IPs (3.x.x.x and 18.x.x.x ranges)

## Socket Files (Unix Domain Sockets)

### Containerd Sockets
- **Main Socket**: `/run/containerd/containerd.sock`
  - Accessible via: `/host/run/containerd/containerd.sock` (from container)
  - Protocol: gRPC
  
- **TTRPC Socket**: `/run/containerd/containerd.sock.ttrpc`
  - Accessible via: `/host/run/containerd/containerd.sock.ttrpc` (from container)
  - Protocol: TTRPC

### Docker Socket (Not Found)
- **Expected**: `/var/run/docker.sock` - ❌ Not found
- **Expected**: `/run/containerd/containerd.sock` - ✅ Found (used by Docker)

## Network Addresses

### Docker Bridge Network
- **Subnet**: `172.17.0.0/16`
- **Gateway**: `172.17.0.1`
- **Container IPs**:
  - `172.17.0.2` - boring_pasteur (busybox container)
  - `172.17.0.1` - Docker bridge gateway (host)

### Host Network
- **Hostname**: `c9d7523bc008`
- **Public IPs** (rotating):
  - `3.148.63.27`
  - `3.132.104.87`
  - `18.118.234.62`
  - `3.139.111.226`

## File System Paths (Accessible URLs/Endpoints)

### Docker Data Directories
- `/var/lib/docker` - Docker root directory
- `/var/lib/docker/containers/` - Container data
- `/var/lib/docker/overlay2/` - Overlay filesystem
- `/var/lib/docker/networks/` - Network configurations

### Containerd Runtime Directories
- `/run/containerd/containerd.sock` - Main socket
- `/run/containerd/io.containerd.runtime.v2.task/moby/` - Runtime tasks

## Summary Table

| Type | URL/Endpoint | Status | Protocol | Notes |
|------|--------------|--------|----------|-------|
| Docker API | `http://localhost:2375` | ✅ Active | HTTP | Unencrypted |
| Docker API | `http://172.17.0.1:2375` | ✅ Active | HTTP | From bridge network |
| Exec Daemon | `http://localhost:26053` | ✅ Active | HTTP | IPv6 |
| Unknown | `http://localhost:26500` | ❌ Inactive | HTTP | Not responding |
| Kubernetes API | `https://localhost:6443` | ❌ Not found | HTTPS | Not installed |
| Kubelet | `http://localhost:10250` | ❌ Not found | HTTP | Not installed |
| ECR Registry | `public.ecr.aws` | ✅ Used | HTTPS | AWS ECR |
| Docker Hub | `index.docker.io` | ✅ Used | HTTPS | Docker Hub |
| IP Info | `http://ipinfo.io` | ✅ Accessible | HTTP | External service |
| IP Info | `http://ifconfig.me` | ✅ Accessible | HTTP | External service |

## Security Notes

### Exposed Endpoints
1. **Docker API (port 2375)**: Unencrypted, accessible from network
2. **Exec Daemon (port 26053)**: Active, IPv6 only
3. **Containerd Socket**: Accessible from privileged containers via bind mount

### Recommendations
1. Enable TLS for Docker API
2. Restrict Docker API access to localhost or use firewall rules
3. Review exec-daemon security configuration
4. Audit privileged container access to containerd socket

## Access Methods

### From Host
- Docker API: `curl http://localhost:2375/info`
- Exec Daemon: `curl http://localhost:26053`

### From Container (Bridge Network)
- Docker API: `curl http://172.17.0.1:2375/info`
- Host filesystem: `/host/run/containerd/containerd.sock`

### From Container (Host Network)
- Docker API: `curl http://localhost:2375/info`
- All host network services accessible
