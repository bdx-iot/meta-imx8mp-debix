FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " \
	file://wlan0.network \
	file://usb0.network \
"

do_install:append() {
	install -Dm 0644 ${WORKDIR}/wlan0.network ${D}${systemd_unitdir}/network/10-wlan0.network
	install -Dm 0644 ${WORKDIR}/usb0.network ${D}${systemd_unitdir}/network/10-usb0.network
}
