# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit eutils

DESCRIPTION="A collection of nifty stuff."
HOMEPAGE="http://www.mohawksoft.org/?q=node/9"
SRC_URI="http://stuge.se/gentoo/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND="(>=dev-db/sqlite-2 <dev-db/sqlite-3)
	>=dev-db/sqlite-3
	>=dev-libs/expat-1.95.7"
DEPEND="${RDEPEND}
	>=sys-apps/sed-3
	app-admin/realpath"

S="${WORKDIR}/${PN/-cvs/}"

src_unpack() {
	unpack "${A}" || die
	ln -s Linux.mak "${S}/config/config.mak" || die
	sed -i -e 's,^SQLITE+=..PHOENIX_HOME.*,SQLITE+=-lsqlite3,' -e 's,^MEXPAT=-lmexpat,MEXPAT=-lexpat,' -e '/cp ..DLLPHOENIX/d' -e 's,^\(DLLPHOENIX=.*\)..LIBVER)$,\1,' "${S}/src/Makefile"
	sed -i -e 's,-lmexpat,-lexpat,' -e 's,-O3 -g ,-O3 -s ,' "${S}/config/unixgcc.mak"
}

src_compile() {
	mkdir -p "${D}/usr"
	make dirs links PREFIX="${D}/usr"
	cd src
	make
}

src_install() {
	cd "${S}/src"
	dolib.so libphoenix.so
}
