# Copyright 2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit eutils

DESCRIPTION="Compares two Intel hex files"
HOMEPAGE="http://members.naspa.net/djs/software/hexcmp.html"
SRC_URI="http://members.naspa.net/djs/software/hexcmp-0.2.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	"

src_unpack() {
	unpack "${A}"
	epatch "${FILESDIR}/soname_noversion.patch"
}

src_compile() {
	cd "${S}/${P}"
	emake clean all
}

src_install() {
	dodoc COPYING
	insinto /usr/include
	doins hexfile.h
	dolib.so "${PN}.so.0.0.0"
}
