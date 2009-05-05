# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit eutils

DESCRIPTION="A filesystem backend tool for vpopmail user and ezmlm list management"
HOMEPAGE=""
SRC_URI="http://stuge.se/epostel/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86"
IUSE=""

RDEPEND=">=dev-db/mysql-3.0
	|| (
		>=net-mail/ezmlm-idx-0.40
		>=net-mail/ezmlm-idx-mysql-0.40
	)
	>=net-mail/vpopmail-5.0
	net-www/apache
	"
DEPEND="${RDEPEND}
	"

src_compile() {
	cd "${S}"
	emake
}

src_install() {
	exeinto /usr/sbin
	exeopts -m 4710 -o root -g apache
	doexe epostel

	diropts -m 700 -o vpopmail
	keepdir /var/lock/epostel
}
