# Copyright 2009 Peter Stuge
# $Header$

inherit distutils

DESCRIPTION="Trac 0.11 plugin for OpenID authentication."
HOMEPAGE="http://bitbucket.org/Dalius/authopenid-plugin/"
SRC_URI="http://bitbucket.org/Dalius/authopenid-plugin/get/v${PV}.tar.bz2"
S="${WORKDIR}/authopenid-plugin"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="|| ( >=www-apps/trac-0.11 <=www-apps/trac-0.12 )
	dev-python/python-openid"
DEPEND="${RDEPEND}
	dev-python/setuptools"

src_compile() {
	:
}

src_install() {
	distutils_src_install
}
