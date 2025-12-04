# All Discovered URLs and Endpoints
Generated: 2025-12-03

## Docker API Endpoints

### Primary Docker Daemon API
- **URL**: `http://localhost:2375`
- **Protocol**: HTTP (unencrypted)
- **Status**: ✅ Accessible
- **Access**: Available from host and containers on bridge network (172.17.0.1:2375)
- **Security**: ⚠️ Unencrypted (security risk)

### Docker API Endpoints Discovered

#### Container Management
- `http://localhost:2375/containers/json` - List all containers
- `http://localhost:2375/containers/json?all=true` - List all containers (including stopped)
- `http://localhost:2375/containers/{id}/json` - Get container details
- `http://localhost:2375/containers/create` - Create new container (POST)
- `http://localhost:2375/containers/{id}/start` - Start container (POST)
- `http://localhost:2375/containers/{id}/stop` - Stop container (POST)
- `http://localhost:2375/containers/{id}/exec` - Create exec instance (POST)
- `http://localhost:2375/exec/{exec_id}/start` - Start exec instance (POST)

#### Image Management
- `http://localhost:2375/images/json` - List all images
- `http://localhost:2375/images/create?fromImage={image}` - Pull image (POST)

#### System Information
- `http://localhost:2375/info` - Docker system information
- `http://localhost:2375/version` - Docker version information

#### Network Management
- `http://localhost:2375/networks` - List all networks
- `http://localhost:2375/networks/{network_id}` - Get network details

#### Events
- `http://localhost:2375/events` - Stream Docker events (GET, streaming)
- `http://localhost:2375/events?since={timestamp}` - Events since timestamp

#### Volumes
- `http://localhost:2375/volumes` - List all volumes

## Container Registry URLs

### Docker Hub (Default Registry)
- **URL**: `https://index.docker.io/v1/`
- **Status**: Configured as default registry
- **Images Pulled From**:
  - `busybox:latest` - `busybox@sha256:e3652a00a2fabd16ce889f0aa32c38eec347b997e73bd09e69c962ec7f8732ee`

### AWS ECR (Elastic Container Registry)
- **URL**: `public.ecr.aws/k0i0n2g5/cursorenvironments/universal:default-5ab0560`
- **Full Image Path**: `public.ecr.aws/k0i0n2g5/cursorenvironments/universal:default-5ab0560`
- **Digest**: `sha256:0caab109222dc93944cbcd9f321580d25614f22de9a0ab18ba96f73349e97959`
- **Status**: ✅ Image present locally
- **Size**: ~5.0 GB

## Network Services & Ports

### Listening Services (from host)

#### Docker Daemon
- **Port**: `2375`
- **Protocol**: HTTP
- **Service**: Docker daemon API
- **Access**: `http://localhost:2375` or `http://172.17.0.1:2375` (from containers)
- **Status**: ✅ Active

#### Cursor Exec Daemon
- **Port**: `26053`
- **Protocol**: HTTP/WebSocket (likely)
- **Service**: Cursor exec-daemon
- **Access**: `http://localhost:26053`
- **Status**: ✅ Active (from process list)

#### Unknown Service
- **Port**: `26500`
- **Protocol**: Unknown
- **Access**: `http://localhost:26500`
- **Status**: ⚠️ Not responding to HTTP

### Kubernetes Ports (Checked - Not Accessible)

All standard Kubernetes ports were checked and found **not accessible**:

- `https://localhost:6443` - Kubernetes API server (HTTPS)
- `http://localhost:6443` - Kubernetes API server (HTTP)
- `http://localhost:8080` - Kubernetes API server (alternative)
- `https://localhost:8443` - Kubernetes API server (alternative HTTPS)
- `http://localhost:10250` - Kubelet API
- `http://localhost:10255` - Kubelet read-only API
- `http://localhost:10256` - Kube-proxy health check
- `http://localhost:9099` - Calico networking
- `http://localhost:2379` - etcd (Kubernetes datastore)
- `http://localhost:6666` - etcd (alternative)
- `http://localhost:4194` - cAdvisor (container metrics)
- `http://localhost:6782` - Weave networking
- `http://localhost:6783` - Weave networking
- `http://localhost:6784` - Weave networking

**Status**: ❌ None accessible (no Kubernetes cluster detected)

## External IP Information Services

### IP Discovery Services (Tested)
- `http://ipinfo.io` - IP geolocation service
  - **Result**: `3.148.63.27` (first check)
  - **Location**: Columbus, Ohio, US
  - **Provider**: AWS EC2 (us-east-2)
  
- `http://ifconfig.me` - Simple IP address service
  - **Results**: Multiple IPs detected (rotating)
    - `3.148.63.27`
    - `3.132.104.87`
    - `18.118.234.62`
    - `3.139.111.226`
  - **Note**: IP addresses rotate (NAT gateway/load balancer)

## Container Network Endpoints

### Docker Bridge Network
- **Subnet**: `172.17.0.0/16`
- **Gateway**: `172.17.0.1`
- **Container IPs**:
  - `172.17.0.2` - boring_pasteur (busybox container)
  - `172.17.0.1` - Docker bridge gateway (Docker API accessible here)

### Docker API from Container Network
- `http://172.17.0.1:2375` - Docker API accessible from bridge network containers
- **Status**: ✅ Accessible (same as localhost:2375)

## Containerd Socket (Unix Domain Socket)

### Socket Paths
- `/run/containerd/containerd.sock` - Main containerd socket
- `/run/containerd/containerd.sock.ttrpc` - TTRPC socket
- **Access**: Via `/host/run/containerd/containerd.sock` from privileged container
- **Status**: ✅ Accessible (readable/writable by root)

## GitHub Repository

### Cloned Repository
- **URL**: `https://github.com/cyberark/kubernetes-rbac-audit.git`
- **Status**: ✅ Cloned to `/workspace/kubernetes-rbac-audit/`
- **Purpose**: Kubernetes RBAC auditing tool

## Summary by Category

### ✅ Active & Accessible
1. `http://localhost:2375` - Docker daemon API
2. `http://172.17.0.1:2375` - Docker daemon API (from containers)
3. `http://localhost:26053` - Cursor exec-daemon
4. `https://index.docker.io/v1/` - Docker Hub registry
5. `public.ecr.aws/k0i0n2g5/cursorenvironments/universal:default-5ab0560` - AWS ECR image
6. `/run/containerd/containerd.sock` - Containerd socket

### ❌ Not Accessible / Not Found
- All Kubernetes API endpoints (6443, 8080, 8443, etc.)
- Kubernetes service endpoints (10250, 10255, 10256, etc.)
- Kubernetes networking (9099, 6782-6784, etc.)
- Kubernetes datastore (2379, 6666)
- Container metrics (4194)

### ⚠️ Security Concerns
- `http://localhost:2375` - Unencrypted Docker API
- `http://172.17.0.1:2375` - Unencrypted Docker API accessible from containers
- `/run/containerd/containerd.sock` - Accessible from privileged containers

## Quick Reference

### Docker API Base URL
```
http://localhost:2375
```

### Common Docker API Endpoints
```
GET  /containers/json              - List containers
GET  /containers/{id}/json         - Container details
POST /containers/create            - Create container
POST /containers/{id}/start        - Start container
POST /containers/{id}/exec         - Create exec
POST /exec/{id}/start              - Start exec
GET  /images/json                 - List images
POST /images/create               - Pull image
GET  /info                        - System info
GET  /networks                    - List networks
GET  /events                      - Stream events
```

### Container Registries
```
Docker Hub:    https://index.docker.io/v1/
AWS ECR:       public.ecr.aws/k0i0n2g5/cursorenvironments/universal
```

### Network Services
```
Docker API:        http://localhost:2375
Docker API (net):  http://172.17.0.1:2375
Cursor Daemon:     http://localhost:26053
Unknown Service:   http://localhost:26500 (not responding)
```

## Notes

1. **Docker API**: Unencrypted HTTP - security risk
2. **IP Rotation**: External IP addresses rotate (NAT/load balancer)
3. **No Kubernetes**: No Kubernetes cluster or endpoints found
4. **Container Access**: Privileged containers can access Docker API and containerd socket
5. **Network Isolation**: Docker bridge network is isolated, only test container active
