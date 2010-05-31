# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI="2"

inherit eutils

MY_PN="32r2741"
DESCRIPTION="IBM ServeRAID 3L/H/HB 4L/Lx/M/Mx/H 5i 6i/i+/m 7k/t CLI"
HOMEPAGE="http://www-947.ibm.com/systems/support/supportsite.wss/docdisplay?lndocid=MIGR-60624&brandind=5000008"
SRC_URI="${MY_PN}.iso"
LICENSE="ServeRAID"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
DEPEND="dev-libs/libcdio
	!dev-libs/libcdio[minimal]"
RDEPEND=""

S="${WORKDIR}"
RESTRICT="fetch strip"

pkg_nofetch() {
	einfo "Please visit the following web page:"
	einfo
	einfo "${HOMEPAGE}"
	einfo
	einfo "and download the file ${SRC_URI} into ${DISTDIR}"
	einfo
}

src_unpack() {
	local SRC_DIR="linux"
	use amd64 && SRC_DIR="${SRC_DIR}_x86_64"
	iso-read -i "${DISTDIR}/${A}" -e "/${SRC_DIR}/scsi/cmdline/${PN}" -o "${PN}"
}

src_install () {
	insinto /usr/sbin
	insopts -m755
	doins ${PN}
}
