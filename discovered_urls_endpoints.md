# Discovered URLs and Endpoints
Consolidated Report - Generated: 2025-12-03

## Docker API Endpoints

### Primary Docker Daemon API
- **URL**: `http://localhost:2375`
- **Protocol**: HTTP (unencrypted)
- **Status**: ✅ Accessible
- **Access**: Available from host and containers on bridge network
- **Security**: ⚠️ Unencrypted (security risk)

### Docker API via Bridge Gateway
- **URL**: `http://172.17.0.1:2375`
- **Protocol**: HTTP (unencrypted)
- **Status**: ✅ Accessible from containers
- **Note**: Same Docker daemon, accessible via bridge network gateway

### Docker API Endpoints Tested
- `http://localhost:2375/containers/json` - List containers
- `http://localhost:2375/containers/json?all=true` - List all containers (including stopped)
- `http://localhost:2375/images/json` - List images
- `http://localhost:2375/info` - Docker system information
- `http://localhost:2375/events` - Docker events stream
- `http://localhost:2375/networks` - List Docker networks
- `http://localhost:2375/volumes` - List Docker volumes
- `http://localhost:2375/containers/{id}/json` - Container details
- `http://localhost:2375/containers/create` - Create container (POST)
- `http://localhost:2375/containers/{id}/start` - Start container (POST)
- `http://localhost:2375/containers/{id}/exec` - Create exec instance (POST)
- `http://localhost:2375/exec/{id}/start` - Start exec instance (POST)
- `http://localhost:2375/images/create` - Pull image (POST)

## Network Services

### Listening Ports Discovered
- **Port 2375**: Docker daemon API (HTTP, unencrypted)
  - `http://localhost:2375`
  - `http://172.17.0.1:2375` (from containers)

- **Port 26053**: Cursor exec-daemon
  - `http://localhost:26053`
  - Status: Service running but not responding to HTTP

- **Port 26500**: Unknown service
  - `http://localhost:26500`
  - Status: Listening but not responding to HTTP

### Kubernetes Ports Checked (All Not Accessible)
- `https://localhost:6443` - Kubernetes API (not accessible)
- `http://localhost:8080` - Kubernetes API alternative (not accessible)
- `https://localhost:8443` - Kubernetes API HTTPS (not accessible)
- `http://localhost:10250` - Kubelet API (not accessible)
- `http://localhost:10255` - Kubelet read-only API (not accessible)
- `http://localhost:10256` - Kube-proxy (not accessible)
- `http://localhost:9099` - Calico (not accessible)
- `http://localhost:2379` - etcd (not accessible)
- `http://localhost:6666` - etcd (not accessible)
- `http://localhost:4194` - cAdvisor (not accessible)
- `http://localhost:6782` - Weave (not accessible)
- `http://localhost:6783` - Weave (not accessible)
- `http://localhost:6784` - Weave (not accessible)

## Container Registry URLs

### AWS ECR (Elastic Container Registry)
- **Registry**: `public.ecr.aws`
- **Full Image URL**: `public.ecr.aws/k0i0n2g5/cursorenvironments/universal:default-5ab0560`
- **Digest**: `sha256:0caab109222dc93944cbcd9f321580d25614f22de9a0ab18ba96f73349e97959`
- **Status**: ✅ Image pulled and running

### Docker Hub
- **Registry**: `docker.io` / `index.docker.io`
- **Registry URL**: `https://index.docker.io/v1/`
- **Image Pulled**: `busybox:latest`
- **Digest**: `sha256:e3652a00a2fabd16ce889f0aa32c38eec347b997e73bd09e69c962ec7f8732ee`
- **Status**: ✅ Image pulled and available

## External IP Information Services

### IP Discovery Services Used
- `http://ipinfo.io` - IP geolocation service
  - Response: IP 3.148.63.27 (Columbus, Ohio, US)
  
- `http://ifconfig.me` - IP address service
  - Response: Multiple IPs (rotating):
    - 3.148.63.27
    - 3.132.104.87
    - 18.118.234.62
    - 3.139.111.226

## GitHub Repository URLs

### Cloned Repository
- **Repository**: `https://github.com/cyberark/kubernetes-rbac-audit.git`
- **Status**: ✅ Cloned to `/workspace/kubernetes-rbac-audit/`

### Git Remote Configuration
- **Remote Origin**: `https://github.com/sathsish90/onelink`
- **Authentication**: Token-based (ghs_g2Dcfpugxz5HieVYISh7tfOmMXthHy1sdjpO)
- **URL Rewrites Configured**:
  - `https://github.com/` → Token-based URL
  - `git@github.com:` → Token-based URL
  - `ssh://git@github.com/` → Token-based URL

## Socket Files (Unix Domain Sockets)

### Containerd Sockets
- **Main Socket**: `/run/containerd/containerd.sock`
  - Accessible via: `/host/run/containerd/containerd.sock` (from container)
  - Protocol: Unix Domain Socket
  - Status: ✅ Accessible (readable/writable by root)

- **TTRPC Socket**: `/run/containerd/containerd.sock.ttrpc`
  - Accessible via: `/host/run/containerd/containerd.sock.ttrpc`
  - Protocol: TTRPC (containerd TTRPC API)

### Docker Socket (Not Found)
- `/var/run/docker.sock` - ❌ Not found
- `/run/containerd/containerd.sock` - ✅ Found (used by Docker)

## Network Addresses

### Docker Bridge Network
- **Subnet**: `172.17.0.0/16`
- **Gateway**: `172.17.0.1`
- **Container IPs**:
  - `172.17.0.2` - busybox container (boring_pasteur)
  - `172.17.0.1` - Docker bridge gateway (Docker API accessible)

### Host Network
- **Hostname**: `c9d7523bc008`
- **Public IPs** (rotating):
  - `3.148.63.27`
  - `3.132.104.87`
  - `18.118.234.62`
  - `3.139.111.226`

## Summary by Category

### ✅ Accessible Endpoints
1. `http://localhost:2375` - Docker API (unencrypted)
2. `http://172.17.0.1:2375` - Docker API via bridge
3. `http://localhost:26053` - Cursor exec-daemon (listening)
4. `http://localhost:26500` - Unknown service (listening)
5. `/run/containerd/containerd.sock` - Containerd socket (accessible)

### ❌ Not Accessible / Not Found
- All Kubernetes API endpoints (6443, 8080, 8443, 10250, etc.)
- Docker socket (`/var/run/docker.sock`)
- Kubernetes config files
- Kubernetes service account tokens

### 🔒 External Services
- `https://index.docker.io/v1/` - Docker Hub registry
- `public.ecr.aws` - AWS ECR registry
- `https://github.com/` - GitHub (with token auth)
- `http://ipinfo.io` - IP geolocation
- `http://ifconfig.me` - IP address service

## Security Notes

### ⚠️ Security Concerns
1. **Unencrypted Docker API** on port 2375
   - Accessible from network
   - No authentication required
   - Risk: High

2. **Containerd Socket Accessible**
   - Accessible from privileged container via `/host` mount
   - Root user can control containerd
   - Risk: Medium

3. **GitHub Token Exposed**
   - Token visible in git config
   - Risk: Medium (if repository access compromised)

### ✅ Secure Configurations
- Containerd socket not mounted into containers by default
- Socket has restrictive permissions (0660 root:root)
- No Kubernetes cluster (reduces attack surface)

## Recommendations

1. **Secure Docker API**:
   - Enable TLS for Docker daemon
   - Restrict access to localhost or use firewall rules
   - Implement authentication

2. **Monitor Socket Access**:
   - Audit containers that mount containerd socket
   - Restrict privileged container usage
   - Use more specific bind mounts instead of `/:/host`

3. **Rotate Credentials**:
   - Rotate GitHub token if exposed
   - Review git configuration for sensitive data

4. **Network Security**:
   - Implement network policies
   - Use encrypted connections where possible
   - Monitor network traffic
