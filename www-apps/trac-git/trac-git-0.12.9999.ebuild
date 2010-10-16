# Copyright 2010 Peter Stuge
# $Header$

inherit git distutils

DESCRIPTION="Trac 0.12 plugin for Git repositories"
HOMEPAGE="http://trac-hacks.org/wiki/GitPlugin"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

EGIT_REPO_URI="http://github.com/hvr/gitplugin.git"

RDEPEND="|| ( >=www-apps/trac-0.12_beta1 <www-apps/trac-0.13 )"
DEPEND="${RDEPEND}
	dev-python/setuptools"

src_unpack() {
	git_src_unpack
}

src_compile() {
	:
}

src_install() {
	distutils_src_install
	dodoc README
}
