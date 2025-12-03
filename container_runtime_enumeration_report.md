# Container Runtime Enumeration Report
Generated: 2025-12-03

## Executive Summary

Comprehensive scan for container runtimes on the host system. Only **Docker with containerd** was found as the active container runtime.

## Active Container Runtimes

### 1. Docker (with containerd backend)
- **Status**: ✅ Active and running
- **API Endpoint**: `http://localhost:2375` (unencrypted)
- **Version**: 28.3.2
- **Storage Driver**: overlay2
- **Root Directory**: `/var/lib/docker`

#### Containerd Integration
- **Socket Location**: `/run/containerd/containerd.sock`
- **Socket Status**: ✅ Exists and accessible
- **Socket Permissions**: `srw-rw----` (root:root)
- **Socket Created**: October 20, 2025
- **Namespaces**:
  - Containers: `moby`
  - Plugins: `plugins.moby`

#### Runtime Engines
- **Default Runtime**: `runc`
- **Available Runtimes**:
  - `io.containerd.runc.v2`: runc
  - `runc`: runc

#### Runtime Details
- **Runc Version**: v1.2.5-0-g59923ef
- **Containerd Commit**: 05044ec0a9a75232cad458027ca83437aae3f4da
- **Init Binary**: docker-init (de40ad0)

## Runtimes NOT Found

### Podman
- ❌ Binary not found in PATH
- ❌ No socket files found
- ❌ No systemd services
- ❌ No configuration files
- ❌ Not installed via package manager

### CRI-O
- ❌ Binary not found in PATH
- ❌ No socket files found
- ❌ No systemd services
- ❌ No configuration files
- ❌ Not installed via package manager

### RKT (rktlet)
- ❌ Binary not found in PATH
- ❌ No socket files found
- ❌ No systemd services
- ❌ No configuration files
- ❌ Not installed via package manager

### LXC/LXD
- ❌ Binary not found in PATH
- ❌ No socket files found
- ❌ No systemd services
- ❌ No configuration files
- ❌ Not installed via package manager

### systemd-nspawn
- ❌ Binary not found in PATH
- ❌ No systemd services
- ❌ Not installed via package manager

## Host System Information

### Init System
- **Init Process**: systemd (`/sbin/init nomodule`)
- **Process ID**: 1
- **Note**: systemd is present but systemctl commands not accessible from container

### Socket Files Found
- `/run/containerd/containerd.sock` - containerd socket (used by Docker)
- No other container runtime sockets detected

## Architecture

```
┌─────────────────────────────────────┐
│         Docker Daemon               │
│    (Port 2375 - unencrypted)         │
└──────────────┬──────────────────────┘
               │
               ▼
┌─────────────────────────────────────┐
│         containerd                   │
│  (/run/containerd/containerd.sock)  │
└──────────────┬──────────────────────┘
               │
               ▼
┌─────────────────────────────────────┐
│         runc                         │
│    (OCI Runtime - v1.2.5)           │
└─────────────────────────────────────┘
```

## Security Observations

### Containerd Socket
- **Location**: `/run/containerd/containerd.sock`
- **Permissions**: `srw-rw----` (root:root, 660)
- **Access**: Only root and root group can access
- **Note**: Socket is not mounted into containers by default (good security practice)

### Docker API
- **Endpoint**: `http://localhost:2375`
- **Encryption**: ❌ Unencrypted (security risk)
- **Access**: Accessible from containers on bridge network (172.17.0.1:2375)
- **Recommendation**: Enable TLS or restrict access

## Container Runtime Interface (CRI)

### CRI Implementation
- Docker uses containerd as its CRI implementation
- Containerd namespace: `moby` (Docker's namespace)
- CRI endpoints not directly exposed (handled by containerd)

### Kubernetes Compatibility
- Docker can act as a CRI runtime for Kubernetes
- However, no Kubernetes cluster detected on this host
- Standard Kubernetes runtime ports (10250, etc.) not accessible

## Findings Summary

| Runtime | Status | Socket | Process | Notes |
|---------|--------|--------|---------|-------|
| Docker | ✅ Active | N/A | Yes | API on port 2375 |
| containerd | ✅ Active | ✅ /run/containerd/containerd.sock | Yes | Used by Docker |
| runc | ✅ Active | N/A | Yes | OCI runtime |
| Podman | ❌ Not found | ❌ | ❌ | Not installed |
| CRI-O | ❌ Not found | ❌ | ❌ | Not installed |
| RKT | ❌ Not found | ❌ | ❌ | Not installed |
| LXC/LXD | ❌ Not found | ❌ | ❌ | Not installed |
| systemd-nspawn | ❌ Not found | ❌ | ❌ | Not installed |

## Recommendations

1. **Secure Docker API**: Enable TLS for Docker daemon API
2. **Monitor containerd**: Ensure containerd socket permissions remain restrictive
3. **Runtime Isolation**: Current setup uses Docker exclusively - consider if additional runtimes needed
4. **Audit Logging**: Enable audit logging for container runtime operations
5. **Update Runtimes**: Ensure runc and containerd are kept up to date

## Conclusion

The host system uses **Docker with containerd** as the sole container runtime. The architecture follows the standard Docker → containerd → runc stack. No other container runtimes (Podman, CRI-O, RKT, LXC/LXD) are installed or active on the system.

The containerd socket exists and is properly secured (root-only access), but the Docker API is exposed unencrypted, which is a security concern.
