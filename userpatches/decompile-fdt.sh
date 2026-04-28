#!/usr/bin/env bash
set -euo pipefail

WORKSPACE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
FDT_FILE="${WORKSPACE_DIR}/rk3399pro-running.fdt"
DTS_FILE="${WORKSPACE_DIR}/rk3399pro-running.dts"

if ! command -v dtc >/dev/null 2>&1; then
  echo "dtc not found. Install device-tree-compiler first."
  exit 1
fi

if [[ ! -f "${FDT_FILE}" ]]; then
  echo "Missing ${FDT_FILE}"
  exit 1
fi

dtc -I dtb -O dts "${FDT_FILE}" -o "${DTS_FILE}"
echo "Generated ${DTS_FILE}"
