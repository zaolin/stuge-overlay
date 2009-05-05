# Copyright 2006 Peter Stuge
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit eutils

DESCRIPTION="Bulk email application"
HOMEPAGE=""
SRC_URI="${P}.tar.bz2"
RESTRICT="nomirror"

LICENSE="stuge.se_proprietary"
SLOT="0"
KEYWORDS="x86"
IUSE="debug"

RDEPEND=">=dev-db/mysql-3.0"
DEPEND="${RDEPEND}
	>=sys-apps/sed-3.0
	"

src_compile() {
	cd "${S}"
	emake
}

pkg_setup() {
	enewgroup cmail
	enewuser cmail -1 -1 /home/cmail cmail -m
}

src_install() {
	exeinto /usr/bin
	exeopts -m 750 -o root -g cmail
	doexe cmail
	exeopts -m 4750 -o root -g cmail
	doexe queuecount

	insinto /etc
	insopts -m 750 -o root -g cmail
	doins cmail.conf

	dodoc cmail.mysql
}

pkg_postinst() {
	elog
	elog "Run the following command to add a cmail cronjob that runs every 10 minutes:"
	elog
        elog "emerge --config =${PF}"
	elog
}

pkg_config() {
	einfo Creating /etc/cron.d/cmail.sh
	echo "5,15,25,35,45,55 * * * * cd ~cmail && ulimit -c unlimited && setuidgid cmail /usr/bin/cmail" > /etc/cron.d/cmail.sh
}
