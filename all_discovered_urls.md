# All Discovered URLs and Endpoints
Generated: 2025-12-03

## Docker API Endpoints

### Docker Daemon API (Unencrypted)
- **Primary Endpoint**: `http://localhost:2375`
- **Gateway Access**: `http://172.17.0.1:2375` (accessible from bridge network containers)

### Docker API Endpoints Used
- `http://localhost:2375/info` - System information
- `http://localhost:2375/containers/json?all=true` - List all containers
- `http://localhost:2375/containers/{id}/json` - Container details
- `http://localhost:2375/containers/create` - Create container
- `http://localhost:2375/containers/{id}/start` - Start container
- `http://localhost:2375/containers/{id}/exec` - Create exec instance
- `http://localhost:2375/exec/{id}/start` - Start exec instance
- `http://localhost:2375/images/json` - List images
- `http://localhost:2375/images/create?fromImage={image}` - Pull image
- `http://localhost:2375/networks` - List networks
- `http://localhost:2375/networks/{name}` - Network details
- `http://localhost:2375/volumes` - List volumes
- `http://localhost:2375/events` - Docker events stream
- `http://localhost:2375/system/info` - System info (not found, use /info)

## Network Services

### Listening Ports
- **Port 2375**: Docker daemon API (HTTP, unencrypted)
- **Port 26053**: Cursor exec-daemon service
- **Port 26500**: Unknown service (not responding to HTTP)

### Tested Kubernetes Ports (Not Accessible)
- `https://localhost:6443` - Kubernetes API (HTTPS)
- `http://localhost:6443` - Kubernetes API (HTTP)
- `http://localhost:8080` - Kubernetes API alternative
- `https://localhost:8443` - Kubernetes API HTTPS alternative
- `http://localhost:10250` - Kubelet API
- `http://localhost:10255` - Kubelet read-only API
- `http://localhost:10256` - Kube-proxy metrics
- `http://localhost:9099` - Calico metrics
- `http://localhost:2379` - etcd API
- `http://localhost:6666` - etcd alternative port
- `http://localhost:4194` - cAdvisor metrics
- `http://localhost:6782` - Weave Net
- `http://localhost:6783` - Weave Net
- `http://localhost:6784` - Weave Net

## Container Registry URLs

### AWS ECR (Elastic Container Registry)
- **Public ECR**: `public.ecr.aws/k0i0n2g5/cursorenvironments/universal:default-5ab0560`
- **Full Image Path**: `public.ecr.aws/k0i0n2g5/cursorenvironments/universal@sha256:0caab109222dc93944cbcd9f321580d25614f22de9a0ab18ba96f73349e97959`

### Docker Hub
- **Docker Hub Index**: `https://index.docker.io/v1/`
- **Busybox Image**: `busybox:latest` (from library/busybox)
- **Image Digest**: `busybox@sha256:e3652a00a2fabd16ce889f0aa32c38eec347b997e73bd09e69c962ec7f8732ee`

## External API Endpoints

### IP Information Services
- `http://ipinfo.io` - IP geolocation service
- `http://ifconfig.me` - Public IP address service

### GitHub
- **Repository**: `https://github.com/sathsish90/onelink`
- **Cloned Repository**: `https://github.com/cyberark/kubernetes-rbac-audit.git`

## Socket Files (Unix Domain Sockets)

### Containerd
- `/run/containerd/containerd.sock` - Main containerd socket
- `/run/containerd/containerd.sock.ttrpc` - TTRPC socket
- `/var/run/containerd/containerd.sock` - Alternative path (not found)

### Docker (Not Found)
- `/var/run/docker.sock` - Docker socket (not mounted)
- `/run/containerd/containerd.sock` - Containerd socket (exists)

## Network Addresses

### Docker Bridge Network
- **Subnet**: `172.17.0.0/16`
- **Gateway**: `172.17.0.1`
- **Container IPs**:
  - `172.17.0.2` - boring_pasteur (busybox container)

### Host Network
- Uses host network mode (no bridge IP)

## File System Paths (Accessible via /host mount)

### Containerd
- `/host/run/containerd/containerd.sock`
- `/host/run/containerd/io.containerd.runtime.v2.task/moby/`

### Docker
- `/host/var/lib/docker/` - Docker root directory
- `/host/var/lib/docker/containers/` - Container data
- `/host/var/lib/docker/overlay2/` - Overlay2 storage

### System
- `/host/etc/hosts` - Host file
- `/host/etc/os-release` - OS information
- `/host/proc/1/cmdline` - Init process

## Summary by Category

### API Endpoints (HTTP/HTTPS)
1. Docker API: `http://localhost:2375` ✅ Active
2. Docker API (bridge): `http://172.17.0.1:2375` ✅ Active
3. Cursor exec-daemon: `http://localhost:26053` ✅ Active
4. Port 26500: Unknown service ❌ Not responding

### Container Registries
1. AWS ECR: `public.ecr.aws` ✅ Used
2. Docker Hub: `https://index.docker.io/v1/` ✅ Configured

### External Services
1. IP Info: `http://ipinfo.io` ✅ Accessible
2. Ifconfig.me: `http://ifconfig.me` ✅ Accessible
3. GitHub: `https://github.com` ✅ Accessible

### Kubernetes Endpoints
- All standard Kubernetes ports tested ❌ Not accessible
- No Kubernetes cluster detected

### Socket Files
1. Containerd: `/run/containerd/containerd.sock` ✅ Exists
2. Docker socket: Not mounted into containers

## Security Notes

### Exposed Services
- ⚠️ **Docker API (2375)**: Unencrypted, accessible from network
- ⚠️ **Docker API (172.17.0.1:2375)**: Accessible from bridge network containers
- ✅ **Containerd socket**: Not mounted, but accessible via /host mount

### Recommendations
1. Enable TLS for Docker API
2. Restrict Docker API access
3. Monitor network access to port 2375
4. Review container network policies

