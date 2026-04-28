# RK3399Pro userpatches

Place your board-specific patches and files here for Armbian build.

Suggested layout for rockchip64 legacy branch:

- `kernel/archive/rockchip64-legacy/` for kernel patches
- `overlay/` for extra files copied into the image

Start from your extracted files in workspace:

- `rk3399pro-running.fdt`
- `rk3399pro-proc-device-tree.tar.gz`
- `rk3399pro-compatible.txt`
- `rk3399pro-model.txt`
