# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit eutils

DESCRIPTION="A qmail-spp plugin to check for envelope recipients in vpopmail."
HOMEPAGE="http://stuge.se/vpexist/"
SRC_URI="http://stuge.se/dl/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86"
IUSE="mysql"

RDEPEND="dev-db/cdb
	use mysql && >=dev-db/mysql-3.0
	|| (
		virtual/qmail
		mail-mta/netqmail
	)
	>=net-mail/vpopmail-5.0
	"
DEPEND="${RDEPEND}
	"

src_compile() {
	cd "${S}"
	use mysql && emake SQL=mysql || emake
}

src_install() {
	exeinto /var/qmail/plugins
	doexe vpexist
	dosbin vpexistd
}
