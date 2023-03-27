FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " \
    file://0001-add-support-for-imx8mp-debix-board.patch \
    ${@bb.utils.contains('MACHINE_FEATURES', 'optee', 'file://optee.cfg','',d)} \
"

DEPENDS:append = " \
    python3-setuptools-native \
    python3-wheel-native \
    imx-atf \
    firmware-imx-8m \
"

# This package aggregates output deployed by other packages,
# so set the appropriate dependencies
do_compile[depends] += " \
    firmware-imx-8m:do_deploy \
    imx-atf:do_deploy \
"
