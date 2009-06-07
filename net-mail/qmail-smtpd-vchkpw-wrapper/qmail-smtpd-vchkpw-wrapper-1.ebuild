# Copyright 2006 Peter Stuge
# $Header$

inherit eutils

DESCRIPTION="Webzoo vchkpw wrapper for qmail-smtpd and SMTP-AUTH"
HOMEPAGE=""
SRC_URI="${P}.tar.bz2"
RESTRICT="nomirror"

LICENSE="stuge.se_proprietary"
SLOT="0"
KEYWORDS="~amd64 x86"
IUSE="debug"

RDEPEND="|| ( >=virtual/qmail-1.03 mail-mta/netqmail )
	>=net-mail/vpopmail-5"
DEPEND="${RDEPEND}"

src_compile() {
	emake
}

src_install() {
	exeinto /usr/sbin
	exeopts -m 4710 -o root -g nofiles
	doexe qmail-smtpd-vchkpw-wrapper
	dodoc README
}
