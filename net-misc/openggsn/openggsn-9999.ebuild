# Copyright 2011 Gentoo Foundation

inherit git autotools

EAPI="2"
DESCRIPTION="An Gateway GPRS Support Node and SGSN emulator"
HOMEPAGE="http://sourceforge.net/projects/ggsn/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="1"
KEYWORDS="~amd64 ~x86"
IUSE=""

EGIT_REPO_URI="git://git.osmocom.org/openggsn.git"
EGIT_BOOTSTRAP="eautoreconf"

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
