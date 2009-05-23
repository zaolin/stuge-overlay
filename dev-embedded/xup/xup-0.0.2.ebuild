# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit eutils

DESCRIPTION="GPL utility for programming Xilinx FPGA/CPLD/PROM on HW-SPAR3E-SK"
HOMEPAGE="http://inisyn.org/src/xup/"
SRC_URI="http://inisyn.org/src/xup/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-libs/libusb
	!dev-embedded/xc3sprog
	"
DEPEND="${RDEPEND}
	dev-embedded/sdcc
	"

src_unpack() {
	unpack "${A}"
	epatch "${FILESDIR}/devlist.txt_HW-SPAR3E-RevD.patch"
	epatch "${FILESDIR}/xc3sprog-usr_share_xup_devlist.txt.patch"
}

src_compile() {
	cd "${S}"
	sdcc -mmcs51 fw.c
	gcc -Wall -O2 -g -o xup main.c lenval.c micro.c ports.c -lusb
	cd XC3Sprog
	emake
}

src_install() {
	insinto /usr/share/xup
	doins fw.ihx prog.xsvf
	dohtml index.html
	dodoc COPYING prog.ucf prog.vhd
	dobin xup
	cd XC3Sprog
	doins devlist.txt
	dodoc README byte-order.txt
	dobin debug bitparse detectchain xc3sprog
}

pkg_postinst() {
	elog "xup requires you to download a new programmer CPLD image to your board when"
	elog "you install or upgrade a new version of xup. This can take a few minutes."
	elog "To do it now, connect the USB cable to your board and run:"
	elog "   emerge --config =${PF}"
}

pkg_config() {
	"${ROOT}/usr/bin/xup" -v 4 /usr/share/xup/prog.xsvf
	elog "If the xup run completed successfully, you can now run xc3sprog to download"
	elog "bitstreams onto your board."
}
