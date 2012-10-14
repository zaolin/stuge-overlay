# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI="2"

inherit eutils

DESCRIPTION="IBM ServeRAID 3L/H/HB 4L/Lx/M/Mx/H 5i 6i/i+/m 7k/t CLI"
HOMEPAGE="http://www-947.ibm.com/support/entry/portal/docdisplay?lndocid=MIGR-5086405"
SRC_URI="ibm_utl_${PN}_${PV}_linux_32-64.zip"
LICENSE="ServeRAID"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
DEPEND=""
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

src_install () {
	insinto /usr/sbin
	insopts -m755
	doins linux/${PN}
}
