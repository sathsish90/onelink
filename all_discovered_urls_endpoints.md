# All Discovered URLs and Endpoints
Generated: 2025-12-03

## Docker API Endpoints

### Main Docker Daemon API
- **Base URL**: `http://localhost:2375`
- **Protocol**: HTTP (unencrypted)
- **Status**: ✅ Accessible
- **Security**: ⚠️ Unencrypted (security risk)

### Docker API via Bridge Network
- **Base URL**: `http://172.17.0.1:2375`
- **Protocol**: HTTP (unencrypted)
- **Status**: ✅ Accessible from containers
- **Note**: Same Docker daemon, accessible via bridge gateway

### Docker API Endpoints Discovered

#### Container Management
- `GET http://localhost:2375/containers/json` - List all containers
- `GET http://localhost:2375/containers/json?all=true` - List all containers (including stopped)
- `GET http://localhost:2375/containers/{id}/json` - Get container details
- `POST http://localhost:2375/containers/create` - Create new container
- `POST http://localhost:2375/containers/{id}/start` - Start container
- `POST http://localhost:2375/containers/{id}/stop` - Stop container
- `POST http://localhost:2375/containers/{id}/exec` - Create exec instance
- `POST http://localhost:2375/exec/{exec_id}/start` - Start exec instance

#### Image Management
- `GET http://localhost:2375/images/json` - List all images
- `POST http://localhost:2375/images/create?fromImage={image}` - Pull image

#### System Information
- `GET http://localhost:2375/info` - Docker system information
- `GET http://localhost:2375/version` - Docker version (not tested but standard endpoint)

#### Network Management
- `GET http://localhost:2375/networks` - List all networks
- `GET http://localhost:2375/networks/{network_id}` - Get network details
- `GET http://localhost:2375/networks/bridge` - Bridge network details

#### Volume Management
- `GET http://localhost:2375/volumes` - List all volumes

#### Events
- `GET http://localhost:2375/events` - Stream Docker events
- `GET http://localhost:2375/events?since={timestamp}` - Events since timestamp

## Other Network Services

### Cursor Exec Daemon
- **URL**: `http://localhost:26053`
- **Protocol**: HTTP
- **Status**: ✅ Listening (IPv6)
- **Purpose**: Cursor IDE exec daemon
- **Auth**: Token-based (seen in process list)

### Unknown Service
- **URL**: `http://localhost:26500`
- **Protocol**: HTTP
- **Status**: ⚠️ Listening but not responding to HTTP requests
- **Purpose**: Unknown

## Kubernetes Endpoints (Checked but Not Accessible)

### Kubernetes API Server
- `https://localhost:6443/api/v1` - ❌ Not accessible
- `http://localhost:6443/api/v1` - ❌ Not accessible
- `https://localhost:8443/api/v1` - ❌ Not accessible

### Kubelet API
- `http://localhost:10250` - ❌ Not accessible
- `http://localhost:10255` - ❌ Not accessible (read-only)

### Kube-proxy
- `http://localhost:10256` - ❌ Not accessible

### etcd
- `http://localhost:2379` - ❌ Not accessible
- `http://localhost:6666` - ❌ Not accessible

### cAdvisor
- `http://localhost:4194` - ❌ Not accessible

### Calico
- `http://localhost:9099` - ❌ Not accessible

### Weave Net
- `http://localhost:6782` - ❌ Not accessible
- `http://localhost:6783` - ❌ Not accessible
- `http://localhost:6784` - ❌ Not accessible

## Network Addresses

### Docker Bridge Network
- **Subnet**: `172.17.0.0/16`
- **Gateway**: `172.17.0.1`
- **Docker API via Gateway**: `http://172.17.0.1:2375`

### Container IPs
- `172.17.0.2` - busybox container (boring_pasteur)
- `172.17.0.3` - Stale ARP entry (no active container)
- `172.17.0.4` - Stale ARP entry (no active container)
- `172.17.0.5` - Stale ARP entry (no active container)

## Unix Domain Sockets (Not HTTP URLs)

### Containerd Socket
- **Path**: `/run/containerd/containerd.sock`
- **Type**: Unix Domain Socket
- **Status**: ✅ Accessible from privileged container
- **Protocol**: gRPC

### Containerd TTRPC Socket
- **Path**: `/run/containerd/containerd.sock.ttrpc`
- **Type**: Unix Domain Socket
- **Status**: ✅ Exists

## External Services (Checked)

### IP Information Services
- `http://ipinfo.io` - ✅ Accessible (returns JSON with IP info)
- `http://ifconfig.me` - ✅ Accessible (returns public IP)

### Public IP Addresses Discovered
- `3.148.63.27` - First check
- `3.132.104.87` - Second check
- `18.118.234.62` - Third check
- `3.139.111.226` - Fourth check
- **Note**: IP rotates (likely NAT gateway)

## Image Registries

### AWS ECR (Elastic Container Registry)
- **Registry**: `public.ecr.aws`
- **Image**: `public.ecr.aws/k0i0n2g5/cursorenvironments/universal:default-5ab0560`
- **Status**: ✅ Used (image pulled successfully)

### Docker Hub
- **Registry**: `docker.io` (index.docker.io)
- **Image**: `busybox:latest`
- **Status**: ✅ Used (image pulled successfully)

## Summary by Category

### ✅ Accessible Endpoints
1. `http://localhost:2375` - Docker API (unencrypted)
2. `http://172.17.0.1:2375` - Docker API via bridge
3. `http://localhost:26053` - Cursor exec daemon
4. `http://localhost:26500` - Unknown service (listening)
5. `http://ipinfo.io` - External IP info service
6. `http://ifconfig.me` - External IP service

### ❌ Not Accessible (Kubernetes)
- All Kubernetes standard ports (6443, 10250, 10255, etc.)
- No Kubernetes cluster detected

### ⚠️ Security Concerns
- Docker API on port 2375 is **unencrypted**
- Docker API accessible from containers on bridge network
- Containerd socket accessible from privileged container

## Quick Reference

### Most Important URLs
```
Docker API:        http://localhost:2375
Docker API (bridge): http://172.17.0.1:2375
Cursor Daemon:     http://localhost:26053
Unknown Service:   http://localhost:26500
```

### Docker API Quick Commands
```bash
# List containers
curl http://localhost:2375/containers/json

# System info
curl http://localhost:2375/info

# List images
curl http://localhost:2375/images/json

# List networks
curl http://localhost:2375/networks

# Stream events
curl http://localhost:2375/events
```

## Network Port Summary

| Port | Service | Status | Protocol |
|------|---------|--------|----------|
| 2375 | Docker API | ✅ Active | HTTP (unencrypted) |
| 26053 | Cursor exec-daemon | ✅ Active | HTTP |
| 26500 | Unknown | ⚠️ Listening | Unknown |
| 6443 | Kubernetes API | ❌ Not active | HTTPS |
| 8080 | Kubernetes API alt | ❌ Not active | HTTP |
| 8443 | Kubernetes API alt | ❌ Not active | HTTPS |
| 10250 | Kubelet API | ❌ Not active | HTTP |
| 10255 | Kubelet read-only | ❌ Not active | HTTP |
| 10256 | Kube-proxy | ❌ Not active | HTTP |
| 2379 | etcd | ❌ Not active | HTTP |
| 4194 | cAdvisor | ❌ Not active | HTTP |
| 9099 | Calico | ❌ Not active | HTTP |
| 6782-6784 | Weave Net | ❌ Not active | HTTP |

## Notes

1. **Docker API**: Primary service, fully accessible and functional
2. **Cursor Services**: Development environment services
3. **Kubernetes**: No cluster detected, all standard ports checked
4. **Network**: Docker bridge network (172.17.0.0/16) with gateway at 172.17.0.1
5. **Security**: Docker API is unencrypted - security risk
