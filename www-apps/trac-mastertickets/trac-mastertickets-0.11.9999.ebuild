# Copyright 2009 Peter Stuge
# $Header$

inherit subversion distutils

DESCRIPTION="Trac 0.11 plugin for ticket dependencies."
HOMEPAGE="http://trac-hacks.org/wiki/MasterTicketsPlugin"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="graphviz gs"

RDEPEND="|| ( >=www-apps/trac-0.11 <=www-apps/trac-0.12 )
	graphviz? ( media-gfx/graphviz )
	gs? ( virtual/ghostscript )"
DEPEND="${RDEPEND}
	dev-python/setuptools"

src_unpack() {
	ESVN_REPO_URI="http://trac-hacks.org/svn/masterticketsplugin/0.11/"
	subversion_src_unpack
}

src_compile() {
	:
}

src_install() {
	distutils_src_install
}
