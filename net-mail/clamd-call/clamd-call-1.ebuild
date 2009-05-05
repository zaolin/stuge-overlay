# Copyright 2006 Peter Stuge
# $Header$

inherit eutils

DESCRIPTION="clamd-queue wrapper so files can be scanned by clamav"
HOMEPAGE=""
SRC_URI="${P}.tar.bz2"
RESTRICT="nomirror"

LICENSE="stuge.se_proprietary"
SLOT="0"
KEYWORDS="x86"
IUSE=""

RDEPEND=">=mail-mta/qmail-1.03
	app-antivirus/clamav"
DEPEND="${RDEPEND}"

src_compile() {
	emake
}

src_install() {
	exeinto /var/qmail/bin
	exeopts -m 4711 -o clamdmail -g qmail
	doexe clamd-call
}
