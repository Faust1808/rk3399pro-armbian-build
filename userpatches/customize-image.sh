#!/usr/bin/env bash
set -euo pipefail

# This runs inside the target rootfs during Armbian image build.

DTB_SRC="/usr/share/rk3399pro/rk3399pro-running.dtb"
DTB_DST_REL="rockchip/rk3399pro-neardi-lz112.dtb"
DTB_DST="/boot/dtb/${DTB_DST_REL}"
ARMBIAN_ENV="/boot/armbianEnv.txt"

if [[ -f "${DTB_SRC}" ]]; then
  mkdir -p "$(dirname "${DTB_DST}")"
  install -m 0644 "${DTB_SRC}" "${DTB_DST}"

  # Ensure armbianEnv exists and points to our DTB.
  touch "${ARMBIAN_ENV}"
  if grep -qE '^\s*fdtfile=' "${ARMBIAN_ENV}"; then
    sed -i "s|^\s*fdtfile=.*$|fdtfile=${DTB_DST_REL}|" "${ARMBIAN_ENV}"
  else
    printf "\n%s\n" "fdtfile=${DTB_DST_REL}" >> "${ARMBIAN_ENV}"
  fi
else
  echo "rk3399pro DTB not found at ${DTB_SRC}; skipping fdtfile override"
fi

