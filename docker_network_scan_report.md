# Docker Network Subnet Scan Report
Generated: 2025-12-03

## Network Configuration

### Docker Bridge Network
- **Subnet**: 172.17.0.0/16
- **Gateway**: 172.17.0.1
- **Network ID**: bb9f8916985ccc2d8328eb7aa3e933fc042f3b48cc2e869d966e29c0d0db3e6d

## Discovered Hosts (from ARP Table)

| IP Address | MAC Address | Status | Notes |
|------------|-------------|--------|-------|
| 172.17.0.1 | 96:9b:88:c9:e6:5c | Active | Docker bridge gateway |
| 172.17.0.2 | ca:74:ce:ca:04:94 | Active | Our busybox container (boring_pasteur) |
| 172.17.0.3 | 00:00:00:00:00:00 | Unknown | Incomplete ARP entry (may be stale) |
| 172.17.0.4 | 00:00:00:00:00:00 | Unknown | Incomplete ARP entry (may be stale) |
| 172.17.0.5 | 00:00:00:00:00:00 | Unknown | Incomplete ARP entry (may be stale) |

## Docker API Scan Results

### Tested IPs for Docker API (port 2375)
- **172.17.0.1**: Gateway - Docker API not accessible from container
- **172.17.0.2**: Our container - N/A (self)
- **172.17.0.3**: No Docker API detected
- **172.17.0.4**: No Docker API detected
- **172.17.0.5**: No Docker API detected

**Note**: The ARP entries with null MAC addresses (00:00:00:00:00:00) are likely stale or incomplete entries. They may represent:
- Previously running containers that have been stopped
- Failed connection attempts
- Network stack artifacts

## Containers in Bridge Network

### Active Containers
1. **boring_pasteur** (7f764d3a9d4287b...)
   - **IP**: 172.17.0.2/16
   - **State**: Running
   - **Image**: busybox:latest
   - **Network**: bridge

### Other Networks
- **host network**: Contains the Cursor environment container (pod-z5ofsiursvfwxjp5kkrmnvik7q-f3268d02)
  - Uses host network mode (no bridge IP assigned)

## Network Route Information

From container perspective:
```
default via 172.17.0.1 dev eth0 
172.17.0.0/16 dev eth0 scope link src 172.17.0.2
```

## Analysis

### Findings
1. **Only one active container** in the bridge network (our busybox container)
2. **ARP table shows entries** for 172.17.0.3, 172.17.0.4, 172.17.0.5 but with null MAC addresses
3. **No other Docker APIs** accessible on the subnet
4. **Gateway (172.17.0.1)** is the Docker bridge interface on the host

### Possible Explanations for ARP Entries
- **Stale entries**: Previous containers that have been stopped/removed
- **Network artifacts**: Incomplete ARP resolution attempts
- **Docker network management**: Docker may create ARP entries during network operations

### Network Isolation
- The Docker bridge network appears to be isolated
- Only our test container is currently active on the bridge network
- The Cursor environment container uses host networking (bypasses bridge)

## Recommendations

1. **Clear ARP cache** to remove stale entries
2. **Monitor network traffic** to identify any active communication
3. **Check Docker logs** for container lifecycle events
4. **Verify network isolation** - ensure no unauthorized containers can join
5. **Review Docker network policies** to prevent container-to-container communication if needed

## Next Steps

1. Monitor ARP table over time to see if entries change
2. Check Docker daemon logs for container creation/deletion events
3. Scan for other container runtimes or orchestration platforms
4. Check for Kubernetes pods that might be using the Docker network
5. Review network policies and firewall rules
