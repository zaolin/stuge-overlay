# Copyright 2007 Peter Stuge
# $Header$

inherit eutils git

DESCRIPTION="POSIX Message Queues MariaDB and MySQL UDF"
HOMEPAGE="http://peter.stuge.se/mysql-posixmq-and-sha256"
EGIT_REPO_URI="git://git.stuge.se/${PN}.git"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=virtual/mysql-5"
DEPEND="${RDEPEND}"

src_compile() {
	cd "${S}"
	emake
}

src_install() {
	exeinto /usr/$(get_libdir)/mysql/plugin
	doexe posixmq.so
}
