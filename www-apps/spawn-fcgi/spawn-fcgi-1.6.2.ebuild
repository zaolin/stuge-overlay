# Copyright 2009 Peter Stuge
# $Header$

inherit eutils

DESCRIPTION="Spawn FastCGI processes"
HOMEPAGE="http://redmine.lighttpd.net/projects/spawn-fcgi/"
SRC_URI="http://www.lighttpd.net/download/${P}.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

src_install() {
	dobin spawn-fcgi
	doman spawn-fcgi.1
	dodoc AUTHORS NEWS README
}
