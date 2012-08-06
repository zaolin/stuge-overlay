# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit eutils qmail

DESCRIPTION="Daemon and qmail-spp plugin to check envelope recipients in vpopmail."
HOMEPAGE="http://stuge.se/vpexist/"
SRC_URI="http://stuge.se/dl/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 x86"
IUSE="mysql qmail-spp"

RDEPEND="dev-db/cdb
	mysql? ( || (
		virtual/mysql
		dev-db/mysql
	) )
	|| (
		virtual/qmail
		mail-mta/netqmail
	)
	>=net-mail/vpopmail-5.0
	"
DEPEND="${RDEPEND}
	"

src_compile() {
	emake $(use mysql && echo SQL=mysql)
}

src_install() {
	use qmail-spp && {
		exeinto "${QMAIL_HOME}/plugins"
		doexe vpexist
	}
	dosbin vpexistd
}

pkg_postinst() {
	echo
	elog "The next step is to start vpexistd, which should run as the vpopmail user."
	elog "Once vpexistd is running, add the line:"
	elog
	elog "plugins/vpexist"
	elog
	elog "in the [rcpt] section of ${QMAIL_HOME}/control/smtpplugins"
	elog "to make qmail-smtpd look up all incoming recipient addresses with vpexistd."
	echo
}
