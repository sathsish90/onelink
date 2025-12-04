# Consolidated List of All Discovered URLs and Endpoints
Generated: 2025-12-03

## Docker API Endpoints

### Active Docker Daemon APIs
- **http://localhost:2375** ✅ Active
  - Docker daemon API (unencrypted)
  - Accessible from host
  - Accessible from containers via bridge gateway
  - Endpoints discovered:
    - `GET /containers/json` - List containers
    - `GET /containers/{id}/json` - Container details
    - `GET /images/json` - List images
    - `GET /networks` - List networks
    - `GET /volumes` - List volumes
    - `GET /info` - System information
    - `GET /events` - Container events stream
    - `POST /containers/create` - Create container
    - `POST /containers/{id}/start` - Start container
    - `POST /containers/{id}/exec` - Create exec instance
    - `POST /exec/{id}/start` - Start exec instance
    - `POST /images/create` - Pull image

- **http://172.17.0.1:2375** ✅ Active
  - Docker daemon API via bridge gateway
  - Same as localhost:2375
  - Accessible from containers on bridge network

## Container Runtime Sockets

### Containerd Sockets
- **/run/containerd/containerd.sock** ✅ Active
  - Unix domain socket
  - Main containerd API socket
  - Accessible from privileged container via `/host` mount
  - Permissions: 0660 root:root

- **/run/containerd/containerd.sock.ttrpc** ✅ Active
  - TTRPC API socket
  - Alternative containerd API endpoint

## Network Services

### Listening Ports (Discovered)
- **http://localhost:2375** ✅ Active
  - Docker daemon API

- **http://localhost:26053** ✅ Active
  - Cursor exec-daemon service
  - LSP, cloud rules, computer-use enabled

- **http://localhost:26500** ⚠️ Listening but not responding
  - Unknown service
  - Port is open but no HTTP response

### Kubernetes Ports (Checked - Not Accessible)
- **https://localhost:6443** ❌ Not accessible
  - Kubernetes API server (standard port)

- **http://localhost:8080** ❌ Not accessible
  - Kubernetes API server (alternative port)

- **https://localhost:8443** ❌ Not accessible
  - Kubernetes API server (HTTPS alternative)

- **http://localhost:10250** ❌ Not accessible
  - Kubelet API

- **http://localhost:10255** ❌ Not accessible
  - Kubelet read-only API

- **http://localhost:10256** ❌ Not accessible
  - Kube-proxy health check

- **http://localhost:9099** ❌ Not accessible
  - Calico networking

- **http://localhost:2379** ❌ Not accessible
  - etcd (Kubernetes datastore)

- **http://localhost:6666** ❌ Not accessible
  - etcd alternative port

- **http://localhost:4194** ❌ Not accessible
  - cAdvisor (container metrics)

- **http://localhost:6782** ❌ Not accessible
  - Weave networking

- **http://localhost:6783** ❌ Not accessible
  - Weave networking

- **http://localhost:6784** ❌ Not accessible
  - Weave networking

## External Services (Used During Enumeration)

### IP Information Services
- **https://ipinfo.io** ✅ Accessible
  - IP geolocation and network information
  - Used to identify host location and provider

- **http://ifconfig.me** ✅ Accessible
  - Simple IP address service
  - Returns public IP address

## Container Image Registries

### AWS ECR (Elastic Container Registry)
- **public.ecr.aws/k0i0n2g5/cursorenvironments/universal:default-5ab0560** ✅ Used
  - Public AWS ECR registry
  - Cursor environment image
  - Image ID: sha256:19317553aab8bca0f715328f2bc7b6331f38686cdb918e81f92063eab9dfa57d
  - Digest: sha256:0caab109222dc93944cbcd9f321580d25614f22de9a0ab18ba96f73349e97959

### Docker Hub
- **https://index.docker.io/v1/** ✅ Configured
  - Docker Hub registry
  - Used for pulling public images

- **docker.io/library/busybox:latest** ✅ Pulled
  - Busybox image from Docker Hub
  - Digest: sha256:e3652a00a2fabd16ce889f0aa32c38eec347b997e73bd09e69c962ec7f8732ee

## GitHub Repositories

### Cloned Repositories
- **https://github.com/sathsish90/onelink** ✅ Cloned
  - Main repository (Nuxt.js project)
  - Remote origin configured

- **https://github.com/cyberark/kubernetes-rbac-audit** ✅ Cloned
  - Kubernetes RBAC auditing tool
  - Cloned to workspace

## Docker Network Endpoints

### Bridge Network
- **172.17.0.0/16** - Docker bridge subnet
- **172.17.0.1** - Bridge gateway (Docker daemon host)
- **172.17.0.2** - Our busybox container (boring_pasteur)

### Host Network
- Containers using host network mode share host's network stack
- No separate IP addresses assigned

## File System Paths (Accessible via Bind Mount)

### Containerd Paths
- `/host/run/containerd/containerd.sock` - Containerd socket
- `/host/run/containerd/containerd.sock.ttrpc` - TTRPC socket
- `/host/run/containerd/io.containerd.runtime.v2.task/` - Runtime tasks

### Docker Paths
- `/host/var/lib/docker/` - Docker root directory
- `/host/var/lib/docker/containers/` - Container data
- `/host/var/lib/docker/overlay2/` - Overlay2 storage driver data

## API Endpoint Summary

### Active Endpoints
| Endpoint | Protocol | Status | Purpose |
|----------|----------|--------|---------|
| http://localhost:2375 | HTTP | ✅ Active | Docker daemon API |
| http://172.17.0.1:2375 | HTTP | ✅ Active | Docker API (via bridge) |
| http://localhost:26053 | HTTP | ✅ Active | Cursor exec-daemon |
| /run/containerd/containerd.sock | Unix Socket | ✅ Active | Containerd API |
| /run/containerd/containerd.sock.ttrpc | Unix Socket | ✅ Active | Containerd TTRPC |

### Inactive/Not Found Endpoints
| Endpoint | Protocol | Status | Expected Purpose |
|----------|----------|--------|------------------|
| https://localhost:6443 | HTTPS | ❌ Not found | Kubernetes API |
| http://localhost:8080 | HTTP | ❌ Not found | Kubernetes API alt |
| http://localhost:10250 | HTTP | ❌ Not found | Kubelet API |
| http://localhost:2379 | HTTP | ❌ Not found | etcd |
| http://localhost:4194 | HTTP | ❌ Not found | cAdvisor |

## Security Notes

### Exposed Services
1. **Docker API (port 2375)** - Unencrypted, accessible from network
2. **Cursor exec-daemon (port 26053)** - Internal service
3. **Containerd socket** - Accessible via privileged container with host mount

### Recommendations
1. **Secure Docker API**: Enable TLS or restrict to localhost
2. **Monitor socket access**: Audit containers with containerd socket access
3. **Network segmentation**: Isolate Docker network from production networks
4. **Firewall rules**: Restrict access to Docker API port

## Quick Reference

### Most Important URLs
- **Docker API**: `http://localhost:2375`
- **Docker API (from container)**: `http://172.17.0.1:2375`
- **Containerd Socket**: `/run/containerd/containerd.sock` (via `/host` mount)
- **Cursor Service**: `http://localhost:26053`

### Container Registry URLs
- **AWS ECR**: `public.ecr.aws`
- **Docker Hub**: `https://index.docker.io/v1/`

### External Services
- **IP Info**: `https://ipinfo.io`
- **IP Check**: `http://ifconfig.me`
