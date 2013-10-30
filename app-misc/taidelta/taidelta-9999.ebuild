# Copyright 2013 Peter Stuge
# $Header$

EAPI=4

inherit eutils git-2

DESCRIPTION="Display tai64n timestamp offsets"
HOMEPAGE="http://git.stuge.se/?p=${PN}.git"
EGIT_REPO_URI="git://git.stuge.se/${PN}.git"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 x86"
IUSE=""

RDEPEND="dev-libs/libtai"
DEPEND="${RDEPEND}"

src_compile() {
	cd "${S}"
	emake
}

src_install() {
	dobin taidelta
}
