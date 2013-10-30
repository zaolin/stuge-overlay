# Copyright 2009-2013 Peter Stuge

EAPI="4"

inherit eutils git-2
DESCRIPTION="A simple server for running CGI applications over FastCGI."
HOMEPAGE="http://nginx.localdomain.pl/wiki/FcgiWrap"
SRC_URI=""
RESTRICT=""

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

EGIT_REPO_URI="git://github.com/gnosek/fcgiwrap.git"

RDEPEND="dev-libs/fcgi"
DEPEND="${RDEPEND}"

src_compile() {
	emake
}

src_install() {
	dobin fcgiwrap
}
