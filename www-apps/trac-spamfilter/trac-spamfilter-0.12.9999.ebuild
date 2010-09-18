# Copyright 2010 Peter Stuge
# $Header$

inherit distutils

ESVN_REPO_URI="http://svn.edgewall.com/repos/trac/plugins/0.12/spam-filter-captcha"
inherit subversion
SRC_URI=""

DESCRIPTION="Trac 0.12 SpamFilter plugin"
HOMEPAGE="http://trac.edgewall.org/wiki/SpamFilter"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="|| ( >=www-apps/trac-0.12_beta1 <=www-apps/trac-0.13 )
	|| ( <dev-python/dnspython-1.7 >=dev-python/dnspython-1.8 )
	dev-python/imaging"
DEPEND="${RDEPEND}
	dev-python/setuptools"
