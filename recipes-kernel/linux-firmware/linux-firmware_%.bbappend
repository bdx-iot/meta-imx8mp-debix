SRC_URI:append: = " git://github.com/murata-wireless/cyw-fmac-nvram.git;protocol=https;nobranch=1;name=nvram;destsuffix=nvram-murata "
SRCREV_nvram = "b5a9984658e16db6bd50ba6b585231dc6760e1eb"
SRC_URI:append: = " git://github.com/murata-wireless/cyw-fmac-fw.git;protocol=https;nobranch=1;name=murata;destsuffix=murata "
SRCREV_murata = "ee4474911c0f422ee340328761de7a1457369ddd"
SRCREV_FORMAT = "linux-firmware-murata"

do_install:append() {
   # Install calibration file
   install -m 0644 ${WORKDIR}/nvram-murata/cyfmac43455-sdio.1HK.txt ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43455-sdio.txt
   install -m 0644 ${WORKDIR}/nvram-murata/cyfmac43455-sdio.1HK.txt ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43455-sdio.fsl,imx8mp-debix.txt
   #take newest murata firmware
   install -m 0644 ${WORKDIR}/murata/cyfmac43455-sdio.bin ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43455-sdio.bin
   install -m 0644 ${WORKDIR}/murata/cyfmac43455-sdio.bin ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43455-sdio.fsl,imx8mp-debix.bin

   install -m 0644 ${WORKDIR}/murata/cyfmac43455-sdio.1HK.clm_blob ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43455-sdio.clm_blob
   install -m 0644 ${WORKDIR}/murata/cyfmac43455-sdio.1HK.clm_blob ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43455-sdio.fsl,imx8mp-debix.clm_blob
}


FILES:${PN}-bcm43455:append = " \
  ${nonarch_base_libdir}/firmware/brcm/brcmfmac43455-sdio.fsl,imx8mp-debix.txt \
  ${nonarch_base_libdir}/firmware/brcm/brcmfmac43455-sdio.fsl,imx8mp-debix.bin \
  ${nonarch_base_libdir}/firmware/brcm/brcmfmac43455-sdio.fsl,imx8mp-debix.clm_blob \
  ${nonarch_base_libdir}/firmware/brcm/brcmfmac43455-sdio.txt \
  ${nonarch_base_libdir}/firmware/brcm/brcmfmac43455-sdio.clm_blob \
  ${nonarch_base_libdir}/firmware/brcm/brcmfmac43455-sdio.bin \
"

RDEPENDS:${PN}-bcm43430:remove = " ${PN}-cypress-license "
