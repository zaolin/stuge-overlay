# Copyright 2010 Gentoo Foundation

inherit git

EAPI="2"
DESCRIPTION=""
HOMEPAGE="http://jim.berlios.de/"
SRC_URI=""

LICENSE="LGPL-2"
SLOT="1"
KEYWORDS="~amd64 ~x86"
IUSE=""

EGIT_REPO_URI="http://repo.or.cz/r/jimtcl.git"
EGIT_BOOTSTRAP=""

RDEPEND=""
DEPEND=""

src_configure() {
	econf --with-jim-ext=nvp --with-jim-shared || die
}

src_compile() {
	emake all docs || die
}

src_install() {
	dobin jimsh || die "dobin failed"
	dolib.so libjim.so || die "dolib failed"
	insinto /usr/include
	doins jim.h jimautoconf.h jim-subcmd.h jim-nvp.h jim-signal.h
	doins jim-win32compat.h jim-eventloop.h jim-config.h
	dodoc AUTHORS README TODO || die "dodoc failed"
	dohtml Tcl.html || die "dohtml failed"
}
