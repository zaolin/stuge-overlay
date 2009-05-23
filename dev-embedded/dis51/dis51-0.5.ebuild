# Copyright 2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit eutils

DESCRIPTION="GPL 8051 Hex-file Disassembler"
HOMEPAGE="http://members.naspa.net/djs/software/dis51.html"
SRC_URI="http://members.naspa.net/djs/software/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	"

src_compile() {
	cd "${S}"
	emake
}

src_install() {
	dodoc COPYING HISTORY NOTES README
	dobin dis51
}
