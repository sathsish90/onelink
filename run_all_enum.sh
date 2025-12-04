#!/bin/bash
# Master enumeration script - runs all enumeration modules

echo "=========================================="
echo "  Container/Pod Pentesting Enumeration  "
echo "=========================================="
echo ""

# Make scripts executable
chmod +x enumerate_docker.sh enumerate_kubernetes.sh enumerate_host.sh lateral_movement.sh 2>/dev/null

echo "[*] Running Docker enumeration..."
./enumerate_docker.sh
echo ""

echo "[*] Running Kubernetes enumeration..."
./enumerate_kubernetes.sh
echo ""

echo "[*] Running host enumeration..."
./enumerate_host.sh
echo ""

echo "[*] Attempting lateral movement..."
./lateral_movement.sh
echo ""

echo "=========================================="
echo "  Enumeration Complete"
echo "=========================================="
echo ""
echo "Next steps:"
echo "1. Review collected information"
echo "2. Attempt credential reuse"
echo "3. Try accessing discovered services"
echo "4. Establish persistence if needed"
echo "5. Document findings"
