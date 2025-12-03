# Environment Enumeration Report
Generated: 2025-12-03

## Summary
Comprehensive enumeration of Docker containers, images, networks, and related infrastructure.

## Docker Containers

### Running Containers (2)
1. **pod-z5ofsiursvfwxjp5kkrmnvik7q-f3268d02**
   - Image: `public.ecr.aws/k0i0n2g5/cursorenvironments/universal:default-5ab0560`
   - Status: Running (Up 8 hours)
   - Network: host mode
   - Command: `/pod-daemon`
   - Labels: Ubuntu 24.04
   - Mounts: None

2. **boring_pasteur** (7f764d3a9d4287b...)
   - Image: `busybox:latest`
   - Status: Running (Up 4 minutes)
   - Network: bridge (172.17.0.2/16)
   - Command: `sleep 3600`
   - Privileged: Yes
   - Mounts: `/:/host` (bind mount, RW, rslave propagation)
   - **SECURITY NOTE**: Privileged container with host root filesystem access

### Stopped Containers (1)
1. **serene_turing** (ff0b8c2c8e97b...)
   - Image: `busybox:latest`
   - Status: Exited (0) 5 hours ago
   - Network: bridge
   - Mounts: `/:/host` (bind mount)

## Docker Images

1. **public.ecr.aws/k0i0n2g5/cursorenvironments/universal:default-5ab0560**
   - Size: ~5.0 GB
   - Digest: `sha256:0caab109222dc93944cbcd9f321580d25614f22de9a0ab18ba96f73349e97959`
   - Source: AWS ECR (public.ecr.aws)
   - Labels: Ubuntu 24.04

2. **busybox:latest**
   - Size: ~4.2 MB
   - Digest: `sha256:e3652a00a2fabd16ce889f0aa32c38eec347b997e73bd09e69c962ec7f8732ee`
   - Source: Docker Hub (library/busybox)

## Docker Networks

1. **bridge** (bb9f8916985c...)
   - Subnet: 172.17.0.0/16
   - Gateway: 172.17.0.1
   - Driver: bridge
   - Default bridge network

2. **host** (ff01284d0b5748...)
   - Driver: host
   - Uses host network stack

3. **none** (09a5d64dcef9c...)
   - Driver: null
   - Isolated network

## Docker Volumes
- **None found** (empty volumes list)

## Docker API
- **Endpoint**: `http://localhost:2375`
- **Status**: Accessible (unencrypted)
- **Security**: ⚠️ Unencrypted Docker daemon API exposed

## Network Services

### Listening Ports
- **2375**: Docker daemon API (unencrypted)
- **26053**: Cursor exec-daemon
- **26500**: Unknown service (not responding to HTTP)

### Kubernetes Ports Checked
- **6443** (Kubernetes API): Not accessible
- **8080** (Kubernetes API alternative): Not accessible
- **8443** (Kubernetes API HTTPS): Not accessible
- **10250** (Kubelet API): Not accessible
- **10255** (Kubelet read-only): Not accessible
- **10256** (Kube-proxy): Not accessible
- **9099** (Calico): Not accessible
- **2379** (etcd): Not accessible
- **6666** (etcd): Not accessible
- **4194** (cAdvisor): Not accessible
- **6782-6784** (Weave): Not accessible

**Conclusion**: No Kubernetes cluster detected on this host.

## Host Information

### Operating System
- **OS**: Debian GNU/Linux 12 (bookworm)
- **Hostname**: c9d7523bc008
- **Init Process**: `/sbin/init nomodule`

### Network Configuration
- **Container IP**: 172.17.0.2 (bridge network)
- **Gateway**: 172.17.0.1
- **Hostname in /etc/hosts**: c9d7523bc008 mapped to 172.17.0.2

## Container Runtimes

### Docker
- **Version**: 28.3.2 (from /info endpoint)
- **Storage Driver**: overlay2
- **Root Dir**: /var/lib/docker
- **Runtime**: runc (v1.2.5)

### Containerd
- **Socket**: `/run/containerd/containerd.sock` (referenced but not accessible from container)
- **Status**: Unknown (socket not mounted)

## Security Findings

### Critical Issues
1. **Unencrypted Docker API** on port 2375
   - Risk: Anyone with network access can control Docker daemon
   - Recommendation: Use TLS or restrict access

2. **Privileged Container with Host Mount**
   - Container ID: 7f764d3a9d4287b38959f9470bb739d4b65eb179ff881314d1a62c62f071820a
   - Has full access to host filesystem via `/host` mount
   - Running in privileged mode
   - **This is a container escape scenario**

3. **Host Network Mode**
   - Cursor container uses host network mode
   - Bypasses Docker network isolation

### Image Sources
- **AWS ECR**: `public.ecr.aws/k0i0n2g5/cursorenvironments/universal`
- **Docker Hub**: `busybox:latest`

## Recommendations

1. **Secure Docker API**: Enable TLS or restrict to localhost
2. **Review Privileged Containers**: Remove unnecessary privileged mode
3. **Audit Bind Mounts**: Review containers with host filesystem access
4. **Network Segmentation**: Consider using bridge networks instead of host mode
5. **Monitor Container Activity**: Log and monitor container creation/execution

## Next Steps for Further Enumeration

1. Scan Docker network subnet (172.17.0.0/16) for other containers
2. Check for containerd socket access
3. Examine host processes and services
4. Check for Kubernetes config files on host
5. Look for other container registries or image sources
6. Check for secrets/credentials in container configs
7. Scan for other container runtimes (podman, cri-o, etc.)
