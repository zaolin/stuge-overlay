# Copyright 2010 Peter Stuge
# $Header$

inherit distutils

EGIT_REPO_URI="http://github.com/lentil/trac-git-plugin.git"
inherit git
SRC_URI=""

DESCRIPTION="Trac 0.12 plugin for Git repositories"
HOMEPAGE="http://github.com/lentil/trac-git-plugin"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="|| ( >=www-apps/trac-0.12 <=www-apps/trac-0.13 )"
DEPEND="${RDEPEND}
	dev-python/setuptools"

src_compile() {
	echo -n '' > "${S}/README"
}

src_install() {
	distutils_src_install
	dodoc README.markdown
}
