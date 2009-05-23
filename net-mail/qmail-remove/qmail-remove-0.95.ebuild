# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit eutils

DESCRIPTION="Manipulate messages in a qmail queue that match a regex"
HOMEPAGE="http://www.linuxmagic.com/opensource/qmail/qmail-remove/"
SRC_URI="http://www.linuxmagic.com/opensource/qmail/qmail-remove/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

src_compile() {
	cd "${S}"
	emake
}

src_install() {
	exeinto /usr/sbin
	doexe qmail-remove
}
