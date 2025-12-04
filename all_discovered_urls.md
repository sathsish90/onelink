# All Discovered URLs and Endpoints
Generated: 2025-12-03

## Docker API Endpoints

### Docker Daemon API (Unencrypted)
- **Primary**: `http://localhost:2375`
- **From Bridge Network**: `http://172.17.0.1:2375`
- **Status**: ✅ Accessible
- **Security**: ⚠️ Unencrypted (security risk)

### Docker API Endpoints Used
- `http://localhost:2375/containers/json?all=true` - List all containers
- `http://localhost:2375/containers/json` - List running containers
- `http://localhost:2375/images/json` - List images
- `http://localhost:2375/info` - Docker system information
- `http://localhost:2375/events` - Docker events stream
- `http://localhost:2375/networks` - List networks
- `http://localhost:2375/volumes` - List volumes
- `http://localhost:2375/containers/{id}/json` - Container details
- `http://localhost:2375/containers/create` - Create container
- `http://localhost:2375/containers/{id}/start` - Start container
- `http://localhost:2375/containers/{id}/exec` - Create exec instance
- `http://localhost:2375/exec/{id}/start` - Start exec instance
- `http://localhost:2375/networks/{name}` - Network details

## Container Registry URLs

### AWS ECR (Elastic Container Registry)
- **Public ECR**: `public.ecr.aws/k0i0n2g5/cursorenvironments/universal:default-5ab0560`
- **Full URL**: `https://public.ecr.aws/k0i0n2g5/cursorenvironments/universal:default-5ab0560`
- **Digest**: `sha256:0caab109222dc93944cbcd9f321580d25614f22de9a0ab18ba96f73349e97959`
- **Status**: ✅ Used (Cursor environment image)

### Docker Hub
- **Registry**: `docker.io` (Docker Hub)
- **Index Server**: `https://index.docker.io/v1/`
- **Image**: `busybox:latest`
- **Digest**: `sha256:e3652a00a2fabd16ce889f0aa32c38eec347b997e73bd09e69c962ec7f8732ee`
- **Status**: ✅ Used

## Network Services & Ports

### Listening Services
- **Docker API**: `http://0.0.0.0:2375` (unencrypted)
- **Cursor Exec Daemon**: `http://[::]:26053` (IPv6)
- **Unknown Service**: `http://0.0.0.0:26500` (not responding to HTTP)

### Kubernetes Ports (Checked - Not Accessible)
- `https://localhost:6443` - Kubernetes API (not accessible)
- `http://localhost:8080` - Kubernetes API alternative (not accessible)
- `https://localhost:8443` - Kubernetes API HTTPS (not accessible)
- `http://localhost:10250` - Kubelet API (not accessible)
- `http://localhost:10255` - Kubelet read-only (not accessible)
- `http://localhost:10256` - Kube-proxy (not accessible)
- `http://localhost:9099` - Calico (not accessible)
- `http://localhost:2379` - etcd (not accessible)
- `http://localhost:6666` - etcd (not accessible)
- `http://localhost:4194` - cAdvisor (not accessible)
- `http://localhost:6782` - Weave (not accessible)
- `http://localhost:6783` - Weave (not accessible)
- `http://localhost:6784` - Weave (not accessible)

### Other Container Ports (Checked - Not Accessible)
- `http://localhost:443` - HTTPS (not accessible)
- `http://localhost:2379` - etcd (not accessible)
- `http://localhost:6666` - etcd (not accessible)
- `http://localhost:4194` - cAdvisor (not accessible)
- `http://localhost:6443` - Kubernetes API (not accessible)
- `http://localhost:8443` - Kubernetes API (not accessible)
- `http://localhost:8080` - HTTP (not accessible)
- `http://localhost:10250` - Kubelet (not accessible)
- `http://localhost:10255` - Kubelet read-only (not accessible)
- `http://localhost:10256` - Kube-proxy (not accessible)
- `http://localhost:9099` - Calico (not accessible)
- `http://localhost:6782-6784` - Weave (not accessible)
- `http://localhost:30000-32767` - NodePort range (not scanned)
- `http://localhost:44134` - Unknown (not accessible)

## External Services

### IP Information Services (Used)
- `http://ipinfo.io` - IP geolocation service
- `http://ifconfig.me` - IP address service

### Discovered Public IPs
- `3.148.63.27` - AWS EC2 instance (us-east-2)
- `3.132.104.87` - AWS EC2 instance (rotated)
- `18.118.234.62` - AWS EC2 instance (rotated)
- `3.139.111.226` - AWS EC2 instance (rotated)

### Hostname
- `ec2-3-148-63-27.us-east-2.compute.amazonaws.com`

## GitHub Repository

### Cloned Repository
- **Repository**: `https://github.com/cyberark/kubernetes-rbac-audit.git`
- **Status**: ✅ Cloned to `/workspace/kubernetes-rbac-audit`

## Socket Files (Unix Domain Sockets)

### Containerd
- `/run/containerd/containerd.sock` - Main containerd socket
- `/run/containerd/containerd.sock.ttrpc` - TTRPC socket
- `/var/run/containerd/containerd.sock` - Alternative path (not found)

### Docker
- `/var/run/docker.sock` - Docker socket (not found, using TCP API instead)

## Network Addresses

### Docker Bridge Network
- **Subnet**: `172.17.0.0/16`
- **Gateway**: `172.17.0.1`
- **Container IPs**:
  - `172.17.0.2` - boring_pasteur (busybox container)

### Host Network
- **Mode**: Host network (used by Cursor container)
- **IP**: Host's network interface

## Summary by Category

### ✅ Accessible Endpoints
1. `http://localhost:2375` - Docker API (unencrypted)
2. `http://172.17.0.1:2375` - Docker API via bridge gateway
3. `http://[::]:26053` - Cursor exec daemon
4. `http://ipinfo.io` - External IP service
5. `http://ifconfig.me` - External IP service

### ⚠️ Security Concerns
1. `http://localhost:2375` - Unencrypted Docker API
2. `http://172.17.0.1:2375` - Docker API accessible from containers

### ❌ Not Accessible (Checked)
- All Kubernetes ports (6443, 8080, 8443, 10250, etc.)
- etcd ports (2379, 6666)
- Container orchestration ports (4194, 9099, 6782-6784)

### 📦 Container Registries
1. `public.ecr.aws` - AWS ECR (public)
2. `docker.io` / `index.docker.io` - Docker Hub

### 🔌 Socket Files
1. `/run/containerd/containerd.sock` - Containerd socket
2. `/run/containerd/containerd.sock.ttrpc` - Containerd TTRPC socket

## Recommendations

1. **Secure Docker API**: Enable TLS for port 2375 or restrict access
2. **Monitor Network**: Watch for unauthorized access to Docker API
3. **Firewall Rules**: Consider restricting Docker API to localhost only
4. **Use HTTPS**: For any external services, use encrypted connections
5. **Audit Logs**: Monitor access to Docker API endpoints

