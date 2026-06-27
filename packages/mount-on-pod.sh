set -euo pipefail

pvc="${1:-}"
image="${2:-busybox}"

if [[ -z "$pvc" ]]; then
  echo "Usage: $0 <pvc-name>"
  exit 1
fi

kubectl run pvc-debug \
  --rm -it \
  --image=busybox \
  --overrides="$(cat <<EOF
{
  "spec": {
    "containers": [{
      "name": "debug",
      "image": "$image",
      "command": ["sh"],
      "stdin": true,
      "tty": true,
      "volumeMounts": [{
        "name": "pvc",
        "mountPath": "/data"
      }]
    }],
    "volumes": [{
      "name": "pvc",
      "persistentVolumeClaim": {
        "claimName": "$pvc"
      }
    }]
  }
}
EOF
)" -- sh