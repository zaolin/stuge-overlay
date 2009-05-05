# Copyright 2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit subversion distutils

DESCRIPTION="Trac 0.10/0.11 plugin for using Git repositories."
HOMEPAGE="http://trac-hacks.org/wiki/GitPlugin"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
DEPEND="dev-python/setuptools"

ESVN_REPO_URI="http://trac-hacks.org/svn/gitplugin/0.11"
ESVN_PROJECT="gitplugin"

src_compile() {
	:
}

src_install() {
	distutils_src_install
	dodoc README
}
