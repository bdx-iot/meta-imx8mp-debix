IMAGE_FEATURES:append = " \
	ssh-server-openssh \
"

IMAGE_INSTALL:append = " \
	openssh-sftp-server \
	iptables \
	curl \
	can-utils \
	iproute2 \
	i2c-tools \
	libgpiod-tools \
	spitools \
	cryptsetup \
	parted \
	e2fsprogs-e2fsck \
	e2fsprogs-resize2fs \
	e2fsprogs-mke2fs \
	${@bb.utils.contains('MACHINE_FEATURES','optee','optee-client optee-os optee-test optee-examples','',d)} \
    linux-firmware-bcm43455 \
	procps \
	psplash \
"
