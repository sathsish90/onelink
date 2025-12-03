#!/bin/bash
# Kubernetes Enumeration Script
# Run from within container/pod

echo "=== Kubernetes Enumeration ==="
echo ""

echo "[*] Checking if we're in a Kubernetes pod..."
if [ -f /host/var/run/secrets/kubernetes.io/serviceaccount/token ]; then
    echo "[+] Service account token found!"
    
    KUBE_TOKEN=$(cat /host/var/run/secrets/kubernetes.io/serviceaccount/token)
    KUBE_CA=/host/var/run/secrets/kubernetes.io/serviceaccount/ca.crt
    KUBE_NAMESPACE=$(cat /host/var/run/secrets/kubernetes.io/serviceaccount/namespace)
    
    echo "Namespace: $KUBE_NAMESPACE"
    echo ""
    
    echo "[*] Attempting to access Kubernetes API..."
    
    # List pods in namespace
    echo "[*] Pods in namespace $KUBE_NAMESPACE:"
    curl -s --cacert $KUBE_CA \
      -H "Authorization: Bearer $KUBE_TOKEN" \
      "https://kubernetes.default.svc/api/v1/namespaces/$KUBE_NAMESPACE/pods" \
      2>/dev/null | python3 -c "import sys, json; \
      pods = json.load(sys.stdin).get('items', []); \
      [print(f\"  - {p['metadata']['name']}: {p['status'].get('phase', 'unknown')}\") for p in pods]" || echo "  Access denied or error"
    echo ""
    
    # List all pods (if permissions allow)
    echo "[*] All pods (if accessible):"
    curl -s --cacert $KUBE_CA \
      -H "Authorization: Bearer $KUBE_TOKEN" \
      "https://kubernetes.default.svc/api/v1/pods" \
      2>/dev/null | python3 -c "import sys, json; \
      pods = json.load(sys.stdin).get('items', []); \
      [print(f\"  - {p['metadata']['name']} ({p['metadata']['namespace']}): {p['status'].get('phase', 'unknown')}\") for p in pods[:20]]" || echo "  Access denied or error"
    echo ""
    
    # List secrets
    echo "[*] Secrets in namespace (if accessible):"
    curl -s --cacert $KUBE_CA \
      -H "Authorization: Bearer $KUBE_TOKEN" \
      "https://kubernetes.default.svc/api/v1/namespaces/$KUBE_NAMESPACE/secrets" \
      2>/dev/null | python3 -c "import sys, json; \
      secrets = json.load(sys.stdin).get('items', []); \
      [print(f\"  - {s['metadata']['name']}\") for s in secrets[:10]]" || echo "  Access denied or error"
    echo ""
    
    # Check service account permissions
    echo "[*] Checking service account permissions..."
    curl -s --cacert $KUBE_CA \
      -H "Authorization: Bearer $KUBE_TOKEN" \
      "https://kubernetes.default.svc/api/v1/namespaces/$KUBE_NAMESPACE/serviceaccounts" \
      2>/dev/null | python3 -m json.tool | head -30 || echo "  Access denied or error"
    echo ""
else
    echo "[-] Not in a Kubernetes pod (no service account token found)"
    echo ""
    
    echo "[*] Checking for Kubernetes components on host..."
    ls -la /host/var/lib/kubelet/ 2>/dev/null | head -10 || echo "  Kubelet directory not found"
    ls -la /host/etc/kubernetes/ 2>/dev/null | head -10 || echo "  Kubernetes config not found"
    echo ""
    
    echo "[*] Searching for kubeconfig files..."
    find /host -name "kubeconfig" -o -name "config" 2>/dev/null | grep -i kube | head -10
    find /host -path "*/kube/config" -o -path "*/.kube/config" 2>/dev/null | head -10
    echo ""
fi

echo "[*] Checking for Kubernetes environment variables..."
env | grep -i kubernetes | head -10
echo ""
