# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit eutils

DESCRIPTION="A qmail-queue replacement for MTA-level antivirus, greylisting, and spam filtering."
HOMEPAGE="http://${PN}.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"


LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND="net-mail/ripmime
	app-antivirus/clamav
	"
DEPEND="${RDEPEND}
	"

src_unpack() {
	unpack "${A}"
	cd "${S}"
	epatch "${FILESDIR}/${PV}-chmod-gw-tmpdir.patch"
}

pkg_setup() {
	enewuser clamdmail -1 -1 /var/qmail/queue/clamd qmail -m
}

src_compile() {
	LDFLAGS="-Wl,-z,now" econf --sbindir=/var/qmail/bin --with-spool-dir=/var/qmail/clamdmail --without-postgres || die
	emake
}

src_install() {
	dodoc AUTHORS COPYING ChangeLog INSTALL NEWS README
	cd src
	exeopts -m 6711 -o clamdmail -g clamav
	exeinto /var/qmail/bin
	doexe clamd-queue
	diropts -m 2750 -o clamdmail -g clamav
	keepdir /var/qmail/clamdmail
}
