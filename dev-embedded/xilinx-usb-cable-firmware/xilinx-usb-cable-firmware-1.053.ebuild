inherit eutils

MY_P="install_drivers"

DESCRIPTION="Xilinx USB Cable FX2 firmware"
HOMEPAGE="http://www.xilinx.com/support/documentation/configuration_hardware.htm"
SRC_URI="${MY_P}.tar.gz"

LICENSE="Xilinx-asis"
SLOT="0"
KEYWORDS="x86 amd64"
RESTRICT="fetch"
IUSE=""

DEPEND=""
RDEPEND="sys-apps/fxload
	sys-fs/udev"

S="${WORKDIR}/${MY_P}/linux_drivers/pcusb"

pkg_nofetch() {
	eerror "Please go to:"
	eerror "  ${HOMEPAGE}"
	eerror "and download the ${SRC_URI} file from the"
	eerror "Configuration Hardware User Guides section."
	eerror "After downloading put them in:"
	eerror "  ${DISTDIR}"
}

src_compile() {
	:
}

src_install() {
	insinto /usr/share
	doins *.hex

	insinto /etc/udev/rules.d
	doins "${FILESDIR}/85-xusbdfwu.rules"
}
