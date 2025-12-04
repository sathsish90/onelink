# All Discovered URLs and Endpoints
Generated: 2025-12-03

## Docker API Endpoints

### Primary Docker Daemon API
- **http://localhost:2375** - Docker daemon API (unencrypted)
  - Status: ✅ Accessible
  - Security: ⚠️ Unencrypted (security risk)
  - Access: Available from host and containers on bridge network

### Docker API via Bridge Network Gateway
- **http://172.17.0.1:2375** - Docker daemon API via bridge gateway
  - Status: ✅ Accessible
  - Security: ⚠️ Unencrypted
  - Access: Accessible from containers on bridge network (172.17.0.0/16)

### Docker API Endpoints Tested
- **http://localhost:2375/containers/json** - List containers
- **http://localhost:2375/containers/json?all=true** - List all containers (including stopped)
- **http://localhost:2375/images/json** - List images
- **http://localhost:2375/info** - Docker system information
- **http://localhost:2375/events** - Docker events stream
- **http://localhost:2375/networks** - List Docker networks
- **http://localhost:2375/networks/bridge** - Bridge network details
- **http://localhost:2375/volumes** - List Docker volumes
- **http://localhost:2375/containers/{id}/json** - Container details
- **http://localhost:2375/containers/create** - Create container (POST)
- **http://localhost:2375/containers/{id}/start** - Start container (POST)
- **http://localhost:2375/containers/{id}/exec** - Create exec instance (POST)
- **http://localhost:2375/exec/{id}/start** - Start exec instance (POST)
- **http://localhost:2375/images/create** - Pull image (POST)
- **http://localhost:2375/system/info** - System info (not found, use /info instead)

## Container Registry URLs

### AWS ECR (Elastic Container Registry)
- **public.ecr.aws/k0i0n2g5/cursorenvironments/universal:default-5ab0560**
  - Type: Public ECR
  - Image: Cursor environment image
  - Digest: sha256:0caab109222dc93944cbcd9f321580d25614f22de9a0ab18ba96f73349e97959
  - Size: ~5.0 GB

### Docker Hub
- **docker.io/library/busybox:latest**
  - Type: Docker Hub (public)
  - Image: busybox
  - Digest: sha256:e3652a00a2fabd16ce889f0aa32c38eec347b997e73bd09e69c962ec7f8732ee
  - Size: ~4.2 MB
  - Registry: https://index.docker.io/v1/

## Network Services & Ports

### Listening Services (from netstat/ss)
- **0.0.0.0:2375** - Docker daemon API (unencrypted)
  - Protocol: TCP
  - Status: ✅ Listening
  - Access: Public (0.0.0.0)

- **0.0.0.0:26500** - Unknown service
  - Protocol: TCP
  - Status: ⚠️ Listening but not responding to HTTP
  - Access: Public (0.0.0.0)

- **:::26053** - Cursor exec-daemon
  - Protocol: TCP6
  - Status: ✅ Listening
  - Access: IPv6 (all interfaces)
  - Service: Cursor exec-daemon (LSP, cloud rules, computer use)

### Kubernetes Ports (Checked - Not Accessible)
- **https://localhost:6443** - Kubernetes API server (HTTPS)
  - Status: ❌ Not accessible
- **http://localhost:6443** - Kubernetes API server (HTTP)
  - Status: ❌ Not accessible
- **http://localhost:8080** - Kubernetes API server (alternative)
  - Status: ❌ Not accessible
- **https://localhost:8443** - Kubernetes API server (alternative HTTPS)
  - Status: ❌ Not accessible
- **http://localhost:10250** - Kubelet API
  - Status: ❌ Not accessible
- **http://localhost:10255** - Kubelet read-only API
  - Status: ❌ Not accessible
- **http://localhost:10256** - Kube-proxy metrics
  - Status: ❌ Not accessible
- **http://localhost:9099** - Calico metrics
  - Status: ❌ Not accessible
- **http://localhost:2379** - etcd client API
  - Status: ❌ Not accessible
- **http://localhost:6666** - etcd peer API
  - Status: ❌ Not accessible
- **http://localhost:4194** - cAdvisor metrics
  - Status: ❌ Not accessible
- **http://localhost:6782** - Weave Net
  - Status: ❌ Not accessible
- **http://localhost:6783** - Weave Net
  - Status: ❌ Not accessible
- **http://localhost:6784** - Weave Net
  - Status: ❌ Not accessible

## External IP Information Services

### IP Discovery Services Used
- **http://ipinfo.io** - IP geolocation service
  - Response: JSON with IP, location, ISP info
  - Result: 3.148.63.27 (Columbus, Ohio, AWS)

- **http://ifconfig.me** - Simple IP address service
  - Response: Plain text IP address
  - Note: IP rotated between requests (3.148.63.27, 3.132.104.87, 18.118.234.62, 3.139.111.226)

## GitHub Repository URLs

### Cloned Repository
- **https://github.com/cyberark/kubernetes-rbac-audit.git**
  - Type: Public GitHub repository
  - Purpose: Kubernetes RBAC audit tool
  - Status: ✅ Cloned successfully

### Git Remote Configuration
- **https://github.com/sathsish90/onelink**
  - Type: GitHub repository
  - Remote: origin
  - Authentication: Token-based (ghs_g2Dcfpugxz5HieVYISh7tfOmMXthHy1sdjpO)
  - Note: Token visible in git config (security concern)

## Socket Files (Unix Domain Sockets)

### Containerd Sockets
- **/run/containerd/containerd.sock** - Main containerd socket
  - Type: Unix Domain Socket
  - Permissions: 0660 (root:root)
  - Status: ✅ Accessible from privileged container

- **/run/containerd/containerd.sock.ttrpc** - TTRPC socket
  - Type: Unix Domain Socket
  - Permissions: 0660 (root:root)
  - Status: ✅ Exists

### Docker Sockets (Not Found)
- **/var/run/docker.sock** - ❌ Not found
- **/run/containerd/containerd.sock** - ✅ Found (used by Docker)

## Network Addresses

### Docker Bridge Network
- **172.17.0.0/16** - Docker bridge subnet
  - Gateway: 172.17.0.1
  - Network ID: bb9f8916985ccc2d8328eb7aa3e933fc042f3b48cc2e869d966e29c0d0db3e6d

### Container IPs Discovered
- **172.17.0.1** - Docker bridge gateway (host Docker daemon)
- **172.17.0.2** - Container: boring_pasteur (busybox)
- **172.17.0.3** - Stale ARP entry (no active container)
- **172.17.0.4** - Stale ARP entry (no active container)
- **172.17.0.5** - Stale ARP entry (no active container)

### Host Network
- **Host network mode** - Used by Cursor container
  - Container: pod-z5ofsiursvfwxjp5kkrmnvik7q-f3268d02
  - No bridge IP assigned (uses host network stack)

## Summary by Category

### ✅ Accessible Endpoints
1. **http://localhost:2375** - Docker API (unencrypted)
2. **http://172.17.0.1:2375** - Docker API via bridge
3. **:::26053** - Cursor exec-daemon
4. **0.0.0.0:26500** - Unknown service (listening)

### ⚠️ Security Concerns
1. **Docker API unencrypted** on port 2375
2. **GitHub token exposed** in git config
3. **Containerd socket accessible** from privileged container

### ❌ Not Found/Not Accessible
1. Kubernetes API endpoints (all ports checked)
2. Kubernetes config files
3. Docker socket at /var/run/docker.sock (not needed, using API)

### 📦 Container Registries
1. **AWS ECR**: public.ecr.aws/k0i0n2g5/cursorenvironments/universal
2. **Docker Hub**: docker.io/library/busybox

## Quick Reference

### Most Important URLs
```
Docker API:        http://localhost:2375
Docker API (bridge): http://172.17.0.1:2375
Cursor Daemon:     http://[::]:26053
External IP Check: http://ifconfig.me
IP Info:           http://ipinfo.io
```

### Container Registry URLs
```
AWS ECR: public.ecr.aws/k0i0n2g5/cursorenvironments/universal:default-5ab0560
Docker Hub: docker.io/library/busybox:latest
```

### Socket Paths
```
Containerd: /run/containerd/containerd.sock
Containerd TTRPC: /run/containerd/containerd.sock.ttrpc
```

## Notes

1. **Docker API**: Unencrypted HTTP API is accessible - security risk
2. **IP Rotation**: External IP changes between requests (NAT/Load Balancer)
3. **No Kubernetes**: All Kubernetes endpoints checked, none accessible
4. **Socket Access**: Containerd socket accessible from privileged container via /host mount
5. **Git Token**: GitHub token visible in git config (should be rotated/secured)
