# Copyright 2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

DESCRIPTION="Compares two Intel hex files"
HOMEPAGE="http://members.naspa.net/djs/software/hexcmp.html"
SRC_URI="http://members.naspa.net/djs/software/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="static"

RDEPEND="!static? ( dev-libs/libhexfile )"
DEPEND="${RDEPEND}
	"

src_compile() {
	cd "${S}"
	emake clean $(use static && echo static || echo all)
}

src_install() {
	dodoc COPYING Changes README
	dohtml hexcmp.html
	dobin hexcmp
}
