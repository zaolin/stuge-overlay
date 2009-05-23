# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit eutils

DESCRIPTION="A pseudo-database memory cache."
HOMEPAGE="http://www.mohawksoft.org/?q=node/9"
SRC_URI="http://stuge.se/gentoo/${P}.tar.bz2 http://stuge.se/gentoo/phoenix-cvs-20060526.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-libs/phoenix-cvs-20060526"
DEPEND="${RDEPEND}
	sys-apps/sed"

S="${WORKDIR}/${PN/-cvs/}"

src_unpack() {
	for a in $A; do
		tar xfj "${PORTAGE_ACTUAL_DISTDIR}/${a}"
	done
        ln -s Linux.mak "phoenix/config/config.mak" || die
	sed -i -e 's,^SQLITE+=..PHOENIX_HOME.*,SQLITE+=-lsqlite3,' -e 's,^MEXPAT=-lmexpat,MEXPAT=-lexpat,' -e 's,\(cp ..DLLPHOENIX.*\),\1/,' phoenix/src/Makefile
	sed -i -e 's,-lmexpat,-lexpat,' -e 's,-O3 -g ,-O3 -s ,' phoenix/config/unixgcc.mak
}

src_compile() {
	make
	mv mcache/mcacheapi.a mcache/libmcacheapi.a
}

src_install() {
	cd "${S}/mcache"
	dosbin mcache
	dolib.a libmcacheapi.a
	cd ../tools
	dosbin madmin mping
	cd ../plugins
	insinto /usr/libexec
	doins plugin.mcm fnplug.mcm fileplug.mcm protplug.mcm execplug.mcm sqlplug.mcm sqlcache.mcm flexplug.mcm
}
