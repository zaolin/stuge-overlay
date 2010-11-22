# Copyright 2010 Gentoo Foundation

EAPI="2"
DESCRIPTION="An Gateway GPRS Support Node and SGSN emulator"
HOMEPAGE="http://sourceforge.net/projects/ggsn/"
SRC_URI="mirror://sourceforge/ggsn/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="1"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_configure() {
	econf || die
}

src_compile() {
	emake || die
}

src_install() {
	emake install DESTDIR="${D}" || die
	insinto /etc
	doins "${FILESDIR}/ggsn.conf"
}
