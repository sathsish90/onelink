# All Discovered URLs and Endpoints
Generated: 2025-12-03

## Docker API Endpoints

### Docker Daemon API (Unencrypted)
- **Primary Endpoint**: `http://localhost:2375`
- **Gateway Access**: `http://172.17.0.1:2375` (accessible from bridge network containers)
- **Status**: ✅ Active and accessible
- **Security**: ⚠️ Unencrypted (security risk)

### Docker API Endpoints Used

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
- `GET http://localhost:2375/version` - Docker version (not tested)

#### Network Management
- `GET http://localhost:2375/networks` - List all networks
- `GET http://localhost:2375/networks/{network_id}` - Network details
- `GET http://localhost:2375/networks/bridge` - Bridge network details

#### Events
- `GET http://localhost:2375/events` - Stream Docker events
- `GET http://localhost:2375/events?since={timestamp}` - Events since timestamp

#### Volumes
- `GET http://localhost:2375/volumes` - List volumes

## Container Registry URLs

### AWS ECR (Elastic Container Registry)
- **Public Registry**: `public.ecr.aws/k0i0n2g5/cursorenvironments/universal:default-5ab0560`
- **Full Image Path**: `public.ecr.aws/k0i0n2g5/cursorenvironments/universal:default-5ab0560`
- **Digest**: `sha256:0caab109222dc93944cbcd9f321580d25614f22de9a0ab18ba96f73349e97959`
- **Image ID**: `sha256:19317553aab8bca0f715328f2bc7b6331f38686cdb918e81f92063eab9dfa57d`

### Docker Hub
- **Registry**: `https://index.docker.io/v1/`
- **Image Pulled**: `busybox:latest`
- **Digest**: `sha256:e3652a00a2fabd16ce889f0aa32c38eec347b997e73bd09e69c962ec7f8732ee`
- **Image ID**: `sha256:08ef35a1c3f050afbbd64194ffd1b8d5878659f5491567f26d1c814513ae9649`

## Network Services & Ports

### Listening Services

#### Docker
- **Port 2375**: `http://localhost:2375` - Docker daemon API (unencrypted)
- **Port 2375 (Gateway)**: `http://172.17.0.1:2375` - Docker API via bridge gateway

#### Cursor/Development Services
- **Port 26053**: `http://localhost:26053` - Cursor exec-daemon
- **Port 26500**: `http://localhost:26500` - Unknown service (not responding to HTTP)

### Kubernetes Ports (Checked - Not Accessible)
- **Port 6443**: `https://localhost:6443` - Kubernetes API (not accessible)
- **Port 8080**: `http://localhost:8080` - Kubernetes API alternative (not accessible)
- **Port 8443**: `https://localhost:8443` - Kubernetes API HTTPS (not accessible)
- **Port 10250**: `http://localhost:10250` - Kubelet API (not accessible)
- **Port 10255**: `http://localhost:10255` - Kubelet read-only API (not accessible)
- **Port 10256**: `http://localhost:10256` - Kube-proxy (not accessible)
- **Port 9099**: `http://localhost:9099` - Calico (not accessible)
- **Port 2379**: `http://localhost:2379` - etcd (not accessible)
- **Port 6666**: `http://localhost:6666` - etcd (not accessible)
- **Port 4194**: `http://localhost:4194` - cAdvisor (not accessible)
- **Port 6782**: `http://localhost:6782` - Weave (not accessible)
- **Port 6783**: `http://localhost:6783` - Weave (not accessible)
- **Port 6784**: `http://localhost:6784` - Weave (not accessible)

## External Services

### IP Information Services
- **ipinfo.io**: `http://ipinfo.io` - IP geolocation service
- **ifconfig.me**: `http://ifconfig.me` - Public IP service

### Discovered Public IPs (Rotating)
- `3.148.63.27` - AWS EC2 instance (us-east-2, Columbus, Ohio)
- `3.132.104.87` - AWS EC2 instance (rotated IP)
- `18.118.234.62` - AWS EC2 instance (rotated IP)
- `3.139.111.226` - AWS EC2 instance (rotated IP)

### Hostname
- **EC2 Hostname**: `ec2-3-148-63-27.us-east-2.compute.amazonaws.com`
- **Internal Hostname**: `c9d7523bc008`

## GitHub Repository

### Cloned Repository
- **Repository**: `https://github.com/cyberark/kubernetes-rbac-audit.git`
- **Local Path**: `/workspace/kubernetes-rbac-audit/`

### Current Project Repository
- **Repository**: `https://github.com/sathsish90/onelink`
- **Remote URL**: `https://github.com/sathsish90/onelink`
- **Git Config**: Uses GitHub token authentication

## Socket Files (Unix Domain Sockets)

### Containerd
- **Main Socket**: `/run/containerd/containerd.sock`
- **TTRPC Socket**: `/run/containerd/containerd.sock.ttrpc`
- **Accessible via**: `/host/run/containerd/containerd.sock` (from container)

### Docker (Not Found)
- `/var/run/docker.sock` - ❌ Not found
- `/run/containerd/containerd.sock` - ✅ Found

## Network Addresses

### Docker Bridge Network
- **Subnet**: `172.17.0.0/16`
- **Gateway**: `172.17.0.1`
- **Container IPs**:
  - `172.17.0.2` - boring_pasteur (busybox container)

### Host Network
- **Mode**: Host network (no bridge IP)
- **Containers**: pod-z5ofsiursvfwxjp5kkrmnvik7q-f3268d02 (Cursor environment)

## File System Paths (Accessible via /host mount)

### Docker Data
- `/host/var/lib/docker` - Docker root directory
- `/host/var/lib/docker/containers/` - Container data
- `/host/var/lib/docker/overlay2/` - Overlay2 storage

### Containerd Data
- `/host/run/containerd/` - Containerd runtime data
- `/host/run/containerd/io.containerd.runtime.v2.task/moby/` - Docker containers in containerd

### System Paths
- `/host/etc/hosts` - Host hosts file
- `/host/etc/os-release` - OS information
- `/host/proc/` - Process information
- `/host/run/` - Runtime data
- `/host/var/run/` - Runtime data

## Summary by Category

### Active HTTP Endpoints
1. `http://localhost:2375` - Docker API (unencrypted)
2. `http://172.17.0.1:2375` - Docker API via gateway
3. `http://localhost:26053` - Cursor exec-daemon

### Container Registries
1. `public.ecr.aws` - AWS ECR (public)
2. `https://index.docker.io/v1/` - Docker Hub

### External APIs
1. `http://ipinfo.io` - IP information
2. `http://ifconfig.me` - Public IP

### GitHub Repositories
1. `https://github.com/cyberark/kubernetes-rbac-audit.git`
2. `https://github.com/sathsish90/onelink`

### Network Addresses
1. `172.17.0.0/16` - Docker bridge network
2. `172.17.0.1` - Docker bridge gateway
3. `172.17.0.2` - Active container IP

## Security Notes

### ⚠️ Unencrypted Endpoints
- Docker API on port 2375 (should use TLS)
- All HTTP endpoints (no HTTPS)

### ✅ Secure Endpoints
- Containerd socket (Unix domain socket, root-only)
- No Kubernetes API exposed

### 🔒 Access Control
- Docker API accessible from bridge network
- Containerd socket accessible from privileged containers with host mount
- No authentication on Docker API
