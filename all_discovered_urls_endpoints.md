# All Discovered URLs and Endpoints
Generated: 2025-12-03

## Docker API Endpoints

### Docker Daemon API (Unencrypted)
- **Primary Endpoint**: `http://localhost:2375`
- **Network Access**: `http://172.17.0.1:2375` (accessible from bridge network)
- **Status**: ✅ Active and accessible
- **Security**: ⚠️ Unencrypted (security risk)

#### Docker API Endpoints Used
- `http://localhost:2375/containers/json` - List containers
- `http://localhost:2375/containers/json?all=true` - List all containers (including stopped)
- `http://localhost:2375/containers/{id}/json` - Container details
- `http://localhost:2375/containers/create` - Create container
- `http://localhost:2375/containers/{id}/start` - Start container
- `http://localhost:2375/containers/{id}/exec` - Create exec instance
- `http://localhost:2375/exec/{id}/start` - Start exec instance
- `http://localhost:2375/images/json` - List images
- `http://localhost:2375/images/create` - Pull image
- `http://localhost:2375/info` - Docker system information
- `http://localhost:2375/events` - Docker events stream
- `http://localhost:2375/networks` - List networks
- `http://localhost:2375/networks/{name}` - Network details
- `http://localhost:2375/volumes` - List volumes
- `http://localhost:2375/system/info` - System info (not found, use `/info`)

## Container Registry URLs

### AWS ECR (Elastic Container Registry)
- **Registry**: `public.ecr.aws`
- **Image**: `public.ecr.aws/k0i0n2g5/cursorenvironments/universal:default-5ab0560`
- **Digest**: `sha256:0caab109222dc93944cbcd9f321580d25614f22de9a0ab18ba96f73349e97959`
- **Type**: Public ECR repository

### Docker Hub
- **Registry**: `docker.io` / `index.docker.io`
- **Image**: `busybox:latest`
- **Digest**: `sha256:e3652a00a2fabd16ce889f0aa32c38eec347b997e73bd09e69c962ec7f8732ee`
- **Index Server**: `https://index.docker.io/v1/`

## Network Services & Ports

### Listening Services
- **Port 2375**: Docker daemon API (HTTP, unencrypted)
  - `http://localhost:2375`
  - `http://172.17.0.1:2375` (from bridge network)
  
- **Port 26053**: Cursor exec-daemon
  - `http://localhost:26053`
  - Status: Listening but not responding to HTTP requests
  
- **Port 26500**: Unknown service
  - `http://localhost:26500`
  - Status: Listening but not responding to HTTP requests

### Kubernetes Ports (Checked - Not Accessible)
- **Port 6443**: Kubernetes API (HTTPS) - ❌ Not accessible
- **Port 8080**: Kubernetes API (HTTP) - ❌ Not accessible
- **Port 8443**: Kubernetes API alternative - ❌ Not accessible
- **Port 10250**: Kubelet API - ❌ Not accessible
- **Port 10255**: Kubelet read-only API - ❌ Not accessible
- **Port 10256**: Kube-proxy - ❌ Not accessible
- **Port 9099**: Calico - ❌ Not accessible
- **Port 2379**: etcd - ❌ Not accessible
- **Port 6666**: etcd alternative - ❌ Not accessible
- **Port 4194**: cAdvisor - ❌ Not accessible
- **Ports 6782-6784**: Weave - ❌ Not accessible

## Network IPs Discovered

### Docker Bridge Network (172.17.0.0/16)
- **Gateway**: `172.17.0.1` (Docker bridge gateway)
  - Docker API accessible: `http://172.17.0.1:2375`
  
- **Container IPs**:
  - `172.17.0.2` - busybox container (boring_pasteur)
  - `172.17.0.3` - Stale ARP entry (no active container)
  - `172.17.0.4` - Stale ARP entry (no active container)
  - `172.17.0.5` - Stale ARP entry (no active container)

### Public IP Addresses (Rotating)
- `3.148.63.27` - AWS EC2 instance (us-east-2)
- `3.132.104.87` - AWS EC2 instance (us-east-2)
- `18.118.234.62` - AWS EC2 instance (us-east-2)
- `3.139.111.226` - AWS EC2 instance (us-east-2)

**Hostname**: `ec2-3-148-63-27.us-east-2.compute.amazonaws.com`
**Location**: Columbus, Ohio, US (us-east-2 region)

## Socket Files

### Containerd Sockets
- **Main Socket**: `/run/containerd/containerd.sock`
  - Accessible via: `/host/run/containerd/containerd.sock` (from container)
  - Permissions: `0660` (root:root)
  - Status: ✅ Accessible from privileged container
  
- **TTRPC Socket**: `/run/containerd/containerd.sock.ttrpc`
  - Accessible via: `/host/run/containerd/containerd.sock.ttrpc`
  - Permissions: `0660` (root:root)

### Docker Socket
- **Location**: `/var/run/docker.sock` - ❌ Not found (not mounted)
- **Note**: Docker API accessible via HTTP on port 2375 instead

## File System Paths (Accessible via /host mount)

### Docker Directories
- `/var/lib/docker` - Docker root directory
- `/var/lib/docker/containers/` - Container data
- `/var/lib/docker/overlay2/` - Overlay2 storage driver
- `/var/lib/docker/networks/` - Network configurations

### Containerd Directories
- `/run/containerd/` - Containerd runtime directory
- `/run/containerd/io.containerd.runtime.v2.task/moby/` - Docker namespace tasks

### System Directories
- `/etc/hosts` - Host file (accessible)
- `/etc/resolv.conf` - DNS configuration (bind mounted)
- `/etc/hostname` - Hostname (bind mounted)
- `/proc/` - Process information (accessible)

## External URLs (from ipinfo.io)

### IP Information Service
- **Service**: `https://ipinfo.io`
- **Endpoint**: `https://ipinfo.io/` (returns JSON with IP info)
- **Alternative**: `https://ifconfig.me` (returns plain IP)

## Summary by Category

### Active HTTP Endpoints
1. `http://localhost:2375` - Docker API (unencrypted)
2. `http://172.17.0.1:2375` - Docker API (from bridge network)
3. `http://localhost:26053` - Cursor exec-daemon (listening)
4. `http://localhost:26500` - Unknown service (listening)

### Container Registries
1. `public.ecr.aws` - AWS ECR (public)
2. `docker.io` / `index.docker.io` - Docker Hub
3. `https://index.docker.io/v1/` - Docker Hub API

### Network Addresses
1. `172.17.0.1` - Docker bridge gateway
2. `172.17.0.2` - Active container IP
3. `3.x.x.x` / `18.x.x.x` - AWS EC2 public IPs (rotating)

### Socket Files
1. `/run/containerd/containerd.sock` - Containerd main socket
2. `/run/containerd/containerd.sock.ttrpc` - Containerd TTRPC socket

### External Services
1. `https://ipinfo.io` - IP geolocation service
2. `https://ifconfig.me` - IP address service

## Security Notes

### ⚠️ High Risk Endpoints
- `http://localhost:2375` - Unencrypted Docker API
- `http://172.17.0.1:2375` - Docker API accessible from containers

### ⚠️ Medium Risk
- `/run/containerd/containerd.sock` - Accessible from privileged containers

### ✅ Secure (Not Accessible)
- All Kubernetes ports (6443, 8080, 10250, etc.) - Not accessible
- Docker socket (`/var/run/docker.sock`) - Not mounted

## Quick Reference

### Docker API Base URLs
```
http://localhost:2375
http://172.17.0.1:2375
```

### Container Registry URLs
```
public.ecr.aws/k0i0n2g5/cursorenvironments/universal:default-5ab0560
docker.io/library/busybox:latest
```

### Network IPs
```
Gateway: 172.17.0.1
Container: 172.17.0.2
Public: 3.x.x.x / 18.x.x.x (rotating)
```

### Socket Paths
```
/host/run/containerd/containerd.sock
/host/run/containerd/containerd.sock.ttrpc
```
