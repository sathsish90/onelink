# All Discovered URLs and Endpoints
Generated: 2025-12-03

## Docker API Endpoints

### Primary Docker Daemon API
- **http://localhost:2375** - Docker daemon API (unencrypted)
  - Status: ✅ Accessible
  - Security: ⚠️ Unencrypted (security risk)
  - Access: Available from containers via `172.17.0.1:2375`

### Docker API Endpoints (via localhost:2375)

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
- `GET http://localhost:2375/version` - Docker version

#### Network Management
- `GET http://localhost:2375/networks` - List all networks
- `GET http://localhost:2375/networks/{network_id}` - Get network details

#### Events
- `GET http://localhost:2375/events` - Stream Docker events
- `GET http://localhost:2375/events?since={timestamp}` - Events since timestamp

#### Volumes
- `GET http://localhost:2375/volumes` - List volumes

### Docker API via Bridge Network
- **http://172.17.0.1:2375** - Docker daemon API (via bridge gateway)
  - Status: ✅ Accessible from containers
  - Same as localhost:2375, accessible via Docker bridge network

## Network Services & Ports

### Listening Services (from netstat/ss)
- **Port 2375** - Docker daemon API (HTTP, unencrypted)
  - Status: ✅ Listening on 0.0.0.0:2375
  - Protocol: TCP
  - Access: Public (all interfaces)

- **Port 26053** - Cursor exec-daemon
  - Status: ✅ Listening on :::26053 (IPv6)
  - Protocol: TCP
  - Service: Cursor execution daemon

- **Port 26500** - Unknown service
  - Status: ✅ Listening on 0.0.0.0:26500
  - Protocol: TCP
  - HTTP Response: Not responding to HTTP requests

### Kubernetes Ports (Checked - Not Accessible)
- **Port 6443** - Kubernetes API server (HTTPS)
  - Status: ❌ Not accessible
  - Protocol: TCP/HTTPS

- **Port 8080** - Kubernetes API server (HTTP, deprecated)
  - Status: ❌ Not accessible
  - Protocol: TCP/HTTP

- **Port 8443** - Kubernetes API server alternative
  - Status: ❌ Not accessible
  - Protocol: TCP/HTTPS

- **Port 10250** - Kubelet API
  - Status: ❌ Not accessible
  - Protocol: TCP/HTTP

- **Port 10255** - Kubelet read-only API
  - Status: ❌ Not accessible
  - Protocol: TCP/HTTP

- **Port 10256** - Kube-proxy health check
  - Status: ❌ Not accessible
  - Protocol: TCP/HTTP

- **Port 9099** - Calico networking
  - Status: ❌ Not accessible
  - Protocol: TCP

- **Port 2379** - etcd (Kubernetes datastore)
  - Status: ❌ Not accessible
  - Protocol: TCP

- **Port 6666** - etcd alternative
  - Status: ❌ Not accessible
  - Protocol: TCP

- **Port 4194** - cAdvisor (container metrics)
  - Status: ❌ Not accessible
  - Protocol: TCP/HTTP

- **Ports 6782-6784** - Weave networking
  - Status: ❌ Not accessible
  - Protocol: TCP

### Other Common Container Ports (Checked)
- **Port 443** - HTTPS (standard)
  - Status: ❌ Not accessible
- **Port 2379** - etcd
  - Status: ❌ Not accessible
- **Port 6666** - etcd alternative
  - Status: ❌ Not accessible
- **Port 4194** - cAdvisor
  - Status: ❌ Not accessible
- **Port 6782-6784** - Weave
  - Status: ❌ Not accessible
- **Port 30000-32767** - Kubernetes NodePort range
  - Status: ❌ Not scanned (too large range)
- **Port 44134** - Unknown
  - Status: ❌ Not accessible

## Container Endpoints

### Running Containers

#### Container: boring_pasteur (7f764d3a9d4287b...)
- **IP**: 172.17.0.2/16
- **Network**: bridge
- **Gateway**: 172.17.0.1
- **Image**: busybox:latest
- **Status**: Running
- **Access**: Via Docker API or direct IP

#### Container: pod-z5ofsiursvfwxjp5kkrmnvik7q-f3268d02
- **IP**: Host network (no bridge IP)
- **Network**: host
- **Image**: public.ecr.aws/k0i0n2g5/cursorenvironments/universal:default-5ab0560
- **Status**: Running
- **Access**: Uses host network stack

## External Services

### IP Information Services (Tested)
- **http://ipinfo.io** - IP geolocation service
  - Status: ✅ Accessible
  - Response: JSON with IP, location, ISP info

- **http://ifconfig.me** - IP address service
  - Status: ✅ Accessible
  - Response: Plain text IP address
  - Note: IP rotates (3.148.63.27, 3.132.104.87, 18.118.234.62, 3.139.111.226)

### Container Registries

#### AWS ECR (Elastic Container Registry)
- **public.ecr.aws/k0i0n2g5/cursorenvironments/universal:default-5ab0560**
  - Status: ✅ Used (image pulled)
  - Type: Public ECR registry
  - Image: Cursor environment image (~5GB)

#### Docker Hub
- **busybox:latest**
  - Status: ✅ Used (image pulled)
  - Type: Docker Hub public registry
  - Image: Busybox (~4MB)

## Socket Files (Unix Domain Sockets)

### Containerd Sockets
- **/run/containerd/containerd.sock**
  - Type: Unix Domain Socket
  - Permissions: 0660 (root:root)
  - Status: ✅ Exists, accessible from privileged container
  - Access: Read/Write from root user

- **/run/containerd/containerd.sock.ttrpc**
  - Type: Unix Domain Socket (TTRPC)
  - Status: ✅ Exists

### Docker Socket
- **/var/run/docker.sock**
  - Status: ❌ Not found (not mounted into containers)

## Network Addresses

### Docker Bridge Network
- **Subnet**: 172.17.0.0/16
- **Gateway**: 172.17.0.1
- **Container IPs**:
  - 172.17.0.2 - boring_pasteur (busybox container)

### Host Network
- **Hostname**: c9d7523bc008
- **Public IPs** (rotating):
  - 3.148.63.27
  - 3.132.104.87
  - 18.118.234.62
  - 3.139.111.226
- **Location**: Columbus, Ohio, US (AWS us-east-2)

## Summary by Category

### ✅ Accessible Endpoints
1. **http://localhost:2375** - Docker API (unencrypted)
2. **http://172.17.0.1:2375** - Docker API via bridge
3. **http://localhost:26053** - Cursor exec-daemon
4. **http://localhost:26500** - Unknown service (listening but not HTTP)
5. **http://ipinfo.io** - External IP service
6. **http://ifconfig.me** - External IP service

### ❌ Not Accessible (Checked)
- All Kubernetes ports (6443, 8080, 8443, 10250, 10255, 10256, 9099, 2379, 6666, 4194, 6782-6784)
- No Kubernetes cluster detected

### ⚠️ Security Concerns
1. **Docker API unencrypted** on port 2375
2. **Publicly accessible** Docker API (0.0.0.0 binding)
3. **Containerd socket accessible** from privileged containers

## Quick Reference

### Most Important URLs
```
Docker API:        http://localhost:2375
Docker API (bridge): http://172.17.0.1:2375
Cursor Daemon:     http://localhost:26053
Unknown Service:   http://localhost:26500
```

### Container IPs
```
Gateway:           172.17.0.1
Busybox Container: 172.17.0.2
```

### Sockets
```
Containerd:        /run/containerd/containerd.sock
Containerd TTRPC:  /run/containerd/containerd.sock.ttrpc
```
