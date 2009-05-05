# Copyright 2007 Peter Stuge
# $Header$

inherit eutils

DESCRIPTION="MySQL SHA256() UDF"
HOMEPAGE="http://stuge.se/mysql-sha256/"
SRC_URI="http://stuge.se/mysql-sha256/${P}.tar.bz2"
RESTRICT=""

LICENSE="public-domain"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

RDEPEND=">=dev-db/mysql-5
	virtual/libc"
DEPEND="${RDEPEND}"

src_compile() {
	emake
}

src_install() {
	exeinto /usr/lib
	doexe sha256.so
}
