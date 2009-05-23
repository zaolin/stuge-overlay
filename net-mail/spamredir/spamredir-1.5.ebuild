# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit eutils

DESCRIPTION="A qmail-queue proxy that changes the envelope recipient for spam"
HOMEPAGE="http://stuge.se/spamredir/"
SRC_URI="http://stuge.se/spamredir/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-db/mysql-3.0
	virtual/qmail
	sys-apps/grep
	sys-apps/coreutils
	"
DEPEND="${RDEPEND}
	"

src_compile() {
	cd "${S}"
	emake
}

src_install() {
	exeinto /var/qmail/bin
	exeopts -m 4711 -o qmailq -g nofiles
	doexe spamredir-queue
}
