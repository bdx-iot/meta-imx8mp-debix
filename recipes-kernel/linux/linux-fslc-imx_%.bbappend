FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " \
    file://0001-arch-arm64-freescale-add-imx8mp-debix-board.patch \
"
