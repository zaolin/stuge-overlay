# Copyright 2010 Gentoo Foundation

inherit git autotools

EAPI="2"
DESCRIPTION="A minimal implementation of a GSM BSC, MSC and HLR"
HOMEPAGE="http://openbsc.osmocom.org/trac/wiki/OpenBSC"
SRC_URI=""

LICENSE="GPL-2"
SLOT="1"
KEYWORDS="~amd64 ~x86"
IUSE="ggsn"

EGIT_REPO_URI="git://git.osmocom.org/openbsc.git"
EGIT_BOOTSTRAP="cd openbsc && eautoreconf"

RDEPEND=">=dev-libs/libosmocore-0.1.27
	dev-db/libdbi
	dev-db/libdbi-drivers[sqlite3]
	ggsn? ( net-misc/openggsn )"
DEPEND="dev-util/pkgconfig
	${RDEPEND}"

src_configure() {
	cd "${S}/${PN}"
	econf || die "configure failed"
}

src_compile() {
	cd "${S}/${PN}"
	emake || die "make failed"
}

src_install() {
	cd "${S}/${PN}"
	emake DESTDIR="${D}" install || die "make install failed"
	dodoc AUTHORS README
	insinto "/usr/share/doc/${PF}/cfg"
	doins src/openbsc.cfg.{1-1,1-2,1-2-hopping,2-2,nanobts{,.multitrx}}
	doins src/mgcp.cfg src/gprs/osmo_{sgsn,gbproxy}.cfg
}
