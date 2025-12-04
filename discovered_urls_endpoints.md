# Discovered URLs and Endpoints - Consolidated Report
Generated: 2025-12-03

## Docker API Endpoints

### Primary Docker Daemon API
- **URL**: `http://localhost:2375`
- **Protocol**: HTTP (unencrypted)
- **Status**: ✅ Accessible
- **Access Level**: Full Docker API access
- **Security**: ⚠️ Unencrypted (security risk)

### Docker API via Bridge Network
- **URL**: `http://172.17.0.1:2375`
- **Protocol**: HTTP (unencrypted)
- **Status**: ✅ Accessible from containers
- **Note**: Same Docker daemon, accessible via bridge gateway IP

### Docker API Endpoints Tested

#### Container Management
- `GET http://localhost:2375/containers/json?all=true` - List all containers
- `GET http://localhost:2375/containers/{id}/json` - Get container details
- `POST http://localhost:2375/containers/create` - Create container
- `POST http://localhost:2375/containers/{id}/start` - Start container
- `POST http://localhost:2375/containers/{id}/stop` - Stop container
- `POST http://localhost:2375/containers/{id}/exec` - Create exec instance
- `POST http://localhost:2375/exec/{exec_id}/start` - Start exec instance

#### Image Management
- `GET http://localhost:2375/images/json` - List images
- `POST http://localhost:2375/images/create?fromImage={image}` - Pull image

#### System Information
- `GET http://localhost:2375/info` - Docker system info
- `GET http://localhost:2375/version` - Docker version
- `GET http://localhost:2375/system/info` - System info (not found, use `/info`)

#### Network Management
- `GET http://localhost:2375/networks` - List networks
- `GET http://localhost:2375/networks/{network_id}` - Network details

#### Events
- `GET http://localhost:2375/events` - Stream Docker events
- `GET http://localhost:2375/events?since={timestamp}` - Events since timestamp

#### Volumes
- `GET http://localhost:2375/volumes` - List volumes

## Container Registry URLs

### AWS ECR (Elastic Container Registry)
- **Registry**: `public.ecr.aws`
- **Full Image URL**: `public.ecr.aws/k0i0n2g5/cursorenvironments/universal:default-5ab0560`
- **Digest**: `sha256:0caab109222dc93944cbcd9f321580d25614f22de9a0ab18ba96f73349e97959`
- **Status**: ✅ Used (Cursor environment image)

### Docker Hub
- **Registry**: `docker.io` / `index.docker.io`
- **Registry URL**: `https://index.docker.io/v1/`
- **Image Pulled**: `busybox:latest`
- **Digest**: `sha256:e3652a00a2fabd16ce889f0aa32c38eec347b997e73bd09e69c962ec7f8732ee`
- **Status**: ✅ Used

## Network Services & Ports

### Listening Services (from netstat/ss)

#### Docker Daemon
- **Port**: `2375`
- **Protocol**: TCP
- **Bind**: `0.0.0.0:2375` (all interfaces)
- **Service**: Docker daemon API
- **Status**: ✅ Active
- **Security**: ⚠️ Unencrypted

#### Cursor Exec Daemon
- **Port**: `26053`
- **Protocol**: TCP6 (IPv6)
- **Bind**: `:::26053`
- **Service**: Cursor exec-daemon
- **Status**: ✅ Active
- **Note**: LSP-enabled, cloud-rules-enabled, computer-use-enabled

#### Unknown Service
- **Port**: `26500`
- **Protocol**: TCP
- **Bind**: `0.0.0.0:26500`
- **Service**: Unknown
- **Status**: ⚠️ Listening but not responding to HTTP

### Kubernetes Ports (Checked - Not Accessible)

#### Kubernetes API Server
- `https://localhost:6443/api/v1` - ❌ Not accessible
- `http://localhost:6443/api/v1` - ❌ Not accessible
- `https://localhost:8443/api/v1` - ❌ Not accessible
- `http://localhost:8080/api/v1` - ❌ Not accessible

#### Kubelet API
- `http://localhost:10250` - ❌ Not accessible
- `http://localhost:10255` - ❌ Not accessible (read-only)

#### Kube-proxy
- `http://localhost:10256` - ❌ Not accessible

#### etcd
- `http://localhost:2379` - ❌ Not accessible
- `http://localhost:6666` - ❌ Not accessible

#### Container Network Plugins
- `http://localhost:9099` - ❌ Not accessible (Calico)
- `http://localhost:6782` - ❌ Not accessible (Weave)
- `http://localhost:6783` - ❌ Not accessible (Weave)
- `http://localhost:6784` - ❌ Not accessible (Weave)

#### cAdvisor
- `http://localhost:4194` - ❌ Not accessible

## External IP Information Services

### IP Information APIs (Tested)
- `http://ipinfo.io` - ✅ Accessible
- `http://ifconfig.me` - ✅ Accessible

**Note**: IP addresses rotated between requests (3.148.63.27, 3.132.104.87, 18.118.234.62, 3.139.111.226), indicating NAT gateway or load balancer.

## Socket Files (Unix Domain Sockets)

### Containerd Sockets
- **Path**: `/run/containerd/containerd.sock`
- **Type**: Unix Domain Socket
- **Protocol**: gRPC
- **Status**: ✅ Exists, accessible from privileged container
- **Permissions**: 0660 (root:root)

- **Path**: `/run/containerd/containerd.sock.ttrpc`
- **Type**: Unix Domain Socket
- **Protocol**: TTRPC
- **Status**: ✅ Exists

### Docker Socket (Not Found)
- `/var/run/docker.sock` - ❌ Not found
- `/run/containerd/containerd.sock` - ✅ Found (used by Docker)

## Container Network IPs

### Docker Bridge Network
- **Subnet**: `172.17.0.0/16`
- **Gateway**: `172.17.0.1` (Docker bridge)
- **Container IPs**:
  - `172.17.0.2` - boring_pasteur (busybox container)
  - `172.17.0.3` - Stale ARP entry (no active container)
  - `172.17.0.4` - Stale ARP entry (no active container)
  - `172.17.0.5` - Stale ARP entry (no active container)

### Docker API via Bridge Gateway
- `http://172.17.0.1:2375` - ✅ Accessible (same as localhost:2375)

## Summary by Category

### ✅ Accessible Endpoints
1. `http://localhost:2375` - Docker API (unencrypted)
2. `http://172.17.0.1:2375` - Docker API via bridge
3. `http://localhost:26053` - Cursor exec-daemon
4. `http://ipinfo.io` - External IP info service
5. `http://ifconfig.me` - External IP info service
6. `/run/containerd/containerd.sock` - Containerd socket (accessible from privileged container)

### ⚠️ Listening but Unknown
1. `http://localhost:26500` - Port listening but not responding

### ❌ Not Accessible (Kubernetes)
1. `https://localhost:6443` - Kubernetes API
2. `http://localhost:8080` - Kubernetes API alternative
3. `http://localhost:10250` - Kubelet API
4. `http://localhost:10255` - Kubelet read-only
5. `http://localhost:10256` - Kube-proxy
6. `http://localhost:2379` - etcd
7. `http://localhost:6666` - etcd
8. `http://localhost:9099` - Calico
9. `http://localhost:6782-6784` - Weave
10. `http://localhost:4194` - cAdvisor

### 🔒 Container Registries
1. `public.ecr.aws` - AWS ECR (public)
2. `docker.io` / `index.docker.io` - Docker Hub

## Security Notes

### High Risk
- **Unencrypted Docker API** (`http://localhost:2375`)
  - Accessible from network
  - No authentication required
  - Full container control

### Medium Risk
- **Containerd Socket** (`/run/containerd/containerd.sock`)
  - Accessible from privileged containers
  - Root access allows containerd control

### Low Risk
- **Cursor Exec Daemon** (`http://localhost:26053`)
  - Internal service
  - Limited exposure

## Recommendations

1. **Secure Docker API**: Enable TLS on port 2375 or restrict to localhost
2. **Firewall Rules**: Block external access to port 2375
3. **Network Policies**: Restrict container-to-container communication
4. **Monitor**: Log all Docker API access
5. **Audit**: Review container registries and image sources

## Quick Reference

### Most Important URLs
- **Docker API**: `http://localhost:2375`
- **Docker API (bridge)**: `http://172.17.0.1:2375`
- **Cursor Daemon**: `http://localhost:26053`
- **Containerd Socket**: `/run/containerd/containerd.sock`

### Container Registries
- **AWS ECR**: `public.ecr.aws`
- **Docker Hub**: `docker.io`
