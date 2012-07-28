# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=3

PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit subversion distutils

DESCRIPTION="A Trac plugin for managing user accounts."
HOMEPAGE="http://trac-hacks.org/wiki/AccountManagerPlugin"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools
	app-arch/unzip"
RDEPEND=">=www-apps/trac-0.11"

src_unpack() {
	ESVN_REPO_URI="http://trac-hacks.org/svn/accountmanagerplugin/trunk"
	subversion_src_unpack
}

src_install() {
	distutils_src_install
	dodoc README README.hashes README.update
}
