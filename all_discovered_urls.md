# Consolidated List of All Discovered URLs and Endpoints
Generated: 2025-12-03

## Active Services & APIs

### Docker API Endpoints
| URL | Protocol | Status | Description | Security |
|-----|----------|--------|--------------|----------|
| `http://localhost:2375` | HTTP | ✅ Active | Docker daemon API (unencrypted) | ⚠️ Unencrypted |
| `http://172.17.0.1:2375` | HTTP | ✅ Active | Docker daemon API via bridge gateway | ⚠️ Unencrypted |

**Docker API Endpoints:**
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

### Cursor Services
| URL | Protocol | Status | Description |
|-----|----------|--------|-------------|
| `http://localhost:26053` | HTTP | ✅ Active | Cursor exec-daemon service |
| `http://localhost:26500` | HTTP | ❓ Unknown | Port listening but not responding to HTTP |

## Inaccessible Services (Checked but Not Found)

### Kubernetes API Endpoints
| URL | Protocol | Status | Description |
|-----|----------|--------|-------------|
| `https://localhost:6443/api/v1` | HTTPS | ❌ Not accessible | Kubernetes API server |
| `http://localhost:6443/api/v1` | HTTP | ❌ Not accessible | Kubernetes API server (HTTP) |
| `http://localhost:8080` | HTTP | ❌ Not accessible | Kubernetes API (alternative port) |
| `https://localhost:8443` | HTTPS | ❌ Not accessible | Kubernetes API HTTPS |

### Kubernetes Component APIs
| URL | Protocol | Status | Description |
|-----|----------|--------|-------------|
| `http://localhost:10250` | HTTP | ❌ Not accessible | Kubelet API |
| `http://localhost:10255` | HTTP | ❌ Not accessible | Kubelet read-only API |
| `http://localhost:10256` | HTTP | ❌ Not accessible | Kube-proxy API |
| `http://localhost:9099` | HTTP | ❌ Not accessible | Calico networking |

### Container Orchestration Services
| URL | Protocol | Status | Description |
|-----|----------|--------|-------------|
| `http://localhost:2379` | HTTP | ❌ Not accessible | etcd (Kubernetes datastore) |
| `http://localhost:6666` | HTTP | ❌ Not accessible | etcd (alternative) |
| `http://localhost:4194` | HTTP | ❌ Not accessible | cAdvisor (container metrics) |
| `http://localhost:6782` | HTTP | ❌ Not accessible | Weave networking |
| `http://localhost:6783` | HTTP | ❌ Not accessible | Weave networking |
| `http://localhost:6784` | HTTP | ❌ Not accessible | Weave networking |

## External Services Used

### IP Information Services
| URL | Protocol | Purpose | Result |
|-----|----------|---------|--------|
| `https://ipinfo.io` | HTTPS | Get public IP and location | ✅ Working (IP: 3.148.63.27, 3.132.104.87, 18.118.234.62, 3.139.111.226) |
| `http://ifconfig.me` | HTTP | Get public IP address | ✅ Working (IPs rotated) |

### GitHub Repositories
| URL | Protocol | Purpose | Status |
|-----|----------|---------|--------|
| `https://github.com/sathsish90/onelink` | HTTPS | Git repository (current workspace) | ✅ Cloned |
| `https://github.com/cyberark/kubernetes-rbac-audit` | HTTPS | Kubernetes RBAC audit tool | ✅ Cloned |

## Container Registry URLs

### AWS ECR (Elastic Container Registry)
| URL | Protocol | Purpose | Status |
|-----|----------|---------|--------|
| `public.ecr.aws/k0i0n2g5/cursorenvironments/universal:default-5ab0560` | HTTPS | Container image source | ✅ Used |
| `public.ecr.aws/k0i0n2g5/cursorenvironments/universal@sha256:0caab109222dc93944cbcd9f321580d25614f22de9a0ab18ba96f73349e97959` | HTTPS | Image digest | ✅ Used |

### Docker Hub
| URL | Protocol | Purpose | Status |
|-----|----------|---------|--------|
| `https://index.docker.io/v1/` | HTTPS | Docker Hub registry | ✅ Configured |
| `busybox:latest` | HTTPS | Container image | ✅ Pulled |
| `busybox@sha256:e3652a00a2fabd16ce889f0aa32c38eec347b997e73bd09e69c962ec7f8732ee` | HTTPS | Image digest | ✅ Used |

## Network Endpoints

### Docker Network IPs
| IP Address | Purpose | Status |
|------------|---------|--------|
| `172.17.0.1` | Docker bridge gateway | ✅ Active |
| `172.17.0.2` | Container IP (boring_pasteur) | ✅ Active |
| `172.17.0.3` | Stale ARP entry | ❓ Unknown |
| `172.17.0.4` | Stale ARP entry | ❓ Unknown |
| `172.17.0.5` | Stale ARP entry | ❓ Unknown |

### Public IP Addresses (Rotating)
| IP Address | Location | Provider |
|------------|----------|----------|
| `3.148.63.27` | Columbus, Ohio, US | AWS (us-east-2) |
| `3.132.104.87` | Columbus, Ohio, US | AWS (us-east-2) |
| `18.118.234.62` | Columbus, Ohio, US | AWS (us-east-2) |
| `3.139.111.226` | Columbus, Ohio, US | AWS (us-east-2) |

**Hostname**: `ec2-3-148-63-27.us-east-2.compute.amazonaws.com`

## Socket Files (Unix Domain Sockets)

### Containerd Sockets
| Path | Type | Status | Access |
|------|------|--------|--------|
| `/run/containerd/containerd.sock` | Unix socket | ✅ Exists | Readable/Writable (root) |
| `/run/containerd/containerd.sock.ttrpc` | Unix socket | ✅ Exists | TTRPC API |

### Docker Sockets (Not Found)
| Path | Type | Status |
|------|------|--------|
| `/var/run/docker.sock` | Unix socket | ❌ Not found |
| `/run/containerd/containerd.sock` | Unix socket | ✅ Found (via /host mount) |

## Summary by Category

### ✅ Active & Accessible
1. **Docker API**: `http://localhost:2375` (unencrypted)
2. **Docker API (Gateway)**: `http://172.17.0.1:2375`
3. **Cursor Exec Daemon**: `http://localhost:26053`
4. **IP Info Services**: `https://ipinfo.io`, `http://ifconfig.me`
5. **GitHub**: Multiple repositories
6. **Container Registries**: AWS ECR, Docker Hub

### ❌ Checked but Not Accessible
1. **Kubernetes API**: Ports 6443, 8080, 8443
2. **Kubelet**: Ports 10250, 10255
3. **Kube-proxy**: Port 10256
4. **etcd**: Ports 2379, 6666
5. **Calico**: Port 9099
6. **Weave**: Ports 6782-6784
7. **cAdvisor**: Port 4194

### ⚠️ Security Concerns
1. **Unencrypted Docker API** on port 2375
2. **Docker API accessible** from bridge network (172.17.0.1:2375)
3. **Containerd socket accessible** from privileged container

## Quick Reference

### Most Important URLs
```
Docker API:        http://localhost:2375
Docker Gateway:    http://172.17.0.1:2375
Cursor Daemon:     http://localhost:26053
IP Info:           https://ipinfo.io
Public IP:         http://ifconfig.me
```

### Container Registry URLs
```
AWS ECR:           public.ecr.aws/k0i0n2g5/cursorenvironments/universal
Docker Hub:        https://index.docker.io/v1/
```

### GitHub Repositories
```
Workspace:         https://github.com/sathsish90/onelink
RBAC Audit Tool:   https://github.com/cyberark/kubernetes-rbac-audit
```

## Notes

1. **Docker API**: Unencrypted HTTP API is a security risk - should use TLS
2. **Port 26500**: Listening but purpose unknown - needs investigation
3. **IP Rotation**: Public IP changes between requests (NAT/Load Balancer)
4. **No Kubernetes**: All Kubernetes-related ports are not accessible
5. **Socket Access**: Containerd socket is accessible from privileged containers
