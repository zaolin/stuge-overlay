# Copyright 2009 Peter Stuge
# $Header$

inherit subversion distutils

EAPI="2"
DESCRIPTION="Trac 0.11 plugin for managing user accounts."
HOMEPAGE="http://trac-hacks.org/wiki/AccountManagerPlugin"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

ESVN_REPO_URI="http://trac-hacks.org/svn/accountmanagerplugin/0.11/"
ESVN_PROJECT="accountmanagerplugin"

RDEPEND="|| ( >=www-apps/trac-0.11 <=www-apps/trac-0.12 )"
DEPEND="${RDEPEND}
	dev-python/setuptools"

src_compile() {
	:
}

src_install() {
	distutils_src_install
	dodoc README
}
