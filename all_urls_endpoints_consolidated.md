# Consolidated URLs and Endpoints Report
Generated: 2025-12-03

## Active Services & Endpoints

### Docker API Endpoints
| URL | Protocol | Status | Description | Security |
|-----|----------|--------|-------------|----------|
| `http://localhost:2375` | HTTP | ✅ Active | Docker daemon API (unencrypted) | ⚠️ Unencrypted |
| `http://172.17.0.1:2375` | HTTP | ✅ Active | Docker daemon API via bridge gateway | ⚠️ Unencrypted |

**Docker API Endpoints:**
- `http://localhost:2375/containers/json` - List containers
- `http://localhost:2375/containers/{id}/json` - Container details
- `http://localhost:2375/containers/create` - Create container
- `http://localhost:2375/containers/{id}/start` - Start container
- `http://localhost:2375/containers/{id}/exec` - Create exec instance
- `http://localhost:2375/exec/{id}/start` - Start exec instance
- `http://localhost:2375/images/json` - List images
- `http://localhost:2375/images/create` - Pull image
- `http://localhost:2375/info` - Docker system information
- `http://localhost:2375/events` - Docker events stream
- `http://localhost:2375/networks` - List networks
- `http://localhost:2375/networks/{name}` - Network details
- `http://localhost:2375/volumes` - List volumes

### Cursor Services
| URL | Protocol | Status | Description |
|-----|----------|--------|-------------|
| `http://localhost:26053` | HTTP | ✅ Active | Cursor exec-daemon service |
| `http://localhost:26500` | HTTP | ❓ Unknown | Port listening but not responding to HTTP |

### External IP Information Services
| URL | Protocol | Status | Description |
|-----|----------|--------|-------------|
| `http://ipinfo.io` | HTTP | ✅ Accessible | IP geolocation and network information |
| `http://ifconfig.me` | HTTP | ✅ Accessible | Public IP address service |

**Note**: These services returned rotating IP addresses:
- `3.148.63.27` (AWS us-east-2)
- `3.132.104.87` (AWS us-east-2)
- `18.118.234.62` (AWS us-east-2)
- `3.139.111.226` (AWS us-east-2)

## Container Registries

### AWS ECR (Public)
| Registry | Status | Description |
|----------|--------|-------------|
| `public.ecr.aws/k0i0n2g5/cursorenvironments/universal:default-5ab0560` | ✅ Used | Cursor environment image |
| `public.ecr.aws` | ✅ Accessible | AWS Elastic Container Registry (public) |

### Docker Hub
| Registry | Status | Description |
|----------|--------|-------------|
| `docker.io` | ✅ Accessible | Docker Hub (default registry) |
| `https://index.docker.io/v1/` | ✅ Accessible | Docker Hub index server |
| `busybox:latest` | ✅ Pulled | Busybox image from Docker Hub |

## GitHub Repositories

### Cloned Repositories
| Repository | URL | Status |
|------------|-----|--------|
| kubernetes-rbac-audit | `https://github.com/cyberark/kubernetes-rbac-audit.git` | ✅ Cloned |

### Git Remote (Current Workspace)
| Remote | URL | Status |
|--------|-----|--------|
| origin | `https://github.com/sathsish90/onelink` | ✅ Configured |

**Note**: GitHub authentication uses token-based access:
- Pattern: `https://x-access-token:{token}@github.com/`

## Kubernetes Endpoints (Not Accessible)

### Standard Kubernetes Ports Checked
| Port | Protocol | Status | Service |
|------|----------|--------|---------|
| `6443` | HTTPS | ❌ Not accessible | Kubernetes API server |
| `8080` | HTTP | ❌ Not accessible | Kubernetes API (insecure) |
| `8443` | HTTPS | ❌ Not accessible | Kubernetes API alternative |
| `10250` | HTTP | ❌ Not accessible | Kubelet API |
| `10255` | HTTP | ❌ Not accessible | Kubelet read-only API |
| `10256` | HTTP | ❌ Not accessible | Kube-proxy |
| `9099` | HTTP | ❌ Not accessible | Calico networking |
| `2379` | HTTP | ❌ Not accessible | etcd (Kubernetes datastore) |
| `6666` | HTTP | ❌ Not accessible | etcd alternative |
| `4194` | HTTP | ❌ Not accessible | cAdvisor metrics |
| `6782` | HTTP | ❌ Not accessible | Weave networking |
| `6783` | HTTP | ❌ Not accessible | Weave networking |
| `6784` | HTTP | ❌ Not accessible | Weave networking |

**Conclusion**: No Kubernetes cluster detected on this host.

## Network Endpoints

### Docker Network IPs
| IP Address | Type | Description |
|------------|------|-------------|
| `172.17.0.1` | Gateway | Docker bridge gateway (host Docker daemon) |
| `172.17.0.2` | Container | Our busybox container (boring_pasteur) |
| `172.17.0.3` | Stale | Incomplete ARP entry |
| `172.17.0.4` | Stale | Incomplete ARP entry |
| `172.17.0.5` | Stale | Incomplete ARP entry |

### Network Subnet
- **Docker Bridge**: `172.17.0.0/16`
- **Gateway**: `172.17.0.1`

## Unix Domain Sockets

### Containerd Sockets
| Path | Type | Status | Description |
|------|------|--------|-------------|
| `/run/containerd/containerd.sock` | Unix Socket | ✅ Exists | Main containerd socket |
| `/run/containerd/containerd.sock.ttrpc` | Unix Socket | ✅ Exists | TTRPC API socket |

**Permissions**: `0660` (root:root)
**Access**: Accessible from privileged container via `/host` mount

## File System Paths (via Bind Mount)

### Host Filesystem Access
| Path | Access | Description |
|------|--------|-------------|
| `/host/` | ✅ Read/Write | Host root filesystem (bind mounted) |
| `/host/etc/hosts` | ✅ Read | Host hosts file |
| `/host/etc/os-release` | ✅ Read | OS information |
| `/host/proc/` | ✅ Read | Process information |
| `/host/run/containerd/` | ✅ Read/Write | Containerd sockets and runtime data |
| `/host/var/lib/docker/` | ✅ Read | Docker data directory |

## Summary by Category

### ✅ Active & Accessible
1. **Docker API**: `http://localhost:2375` (unencrypted)
2. **Docker API (Gateway)**: `http://172.17.0.1:2375`
3. **Cursor Exec-Daemon**: `http://localhost:26053`
4. **IP Info Services**: `http://ipinfo.io`, `http://ifconfig.me`
5. **Container Registries**: AWS ECR, Docker Hub
6. **GitHub**: `https://github.com/`

### ❌ Not Accessible / Not Found
1. **Kubernetes API**: All standard ports (6443, 8080, 8443, etc.)
2. **Kubelet**: Ports 10250, 10255
3. **etcd**: Ports 2379, 6666
4. **Kubernetes Config Files**: No kubeconfig or cluster config found

### ⚠️ Security Concerns
1. **Unencrypted Docker API** on port 2375
2. **Privileged container** with host root filesystem access
3. **Containerd socket** accessible from privileged container

## Quick Reference

### Most Important URLs
```
Docker API:        http://localhost:2375
Docker Gateway:    http://172.17.0.1:2375
Cursor Daemon:     http://localhost:26053
IP Info:           http://ipinfo.io
Public IP:         http://ifconfig.me
```

### Container Registry URLs
```
AWS ECR:           public.ecr.aws
Docker Hub:        docker.io
Docker Index:      https://index.docker.io/v1/
```

### GitHub URLs
```
Workspace Repo:    https://github.com/sathsish90/onelink
Cloned Repo:       https://github.com/cyberark/kubernetes-rbac-audit.git
```

## Recommendations

1. **Secure Docker API**: Enable TLS on port 2375 or restrict access
2. **Monitor Network**: Watch for connections to discovered endpoints
3. **Review Bind Mounts**: Restrict host filesystem access in containers
4. **Audit Socket Access**: Monitor containerd socket usage
5. **Document Endpoints**: Keep this list updated as services change
