# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/flup/flup-1.0.2.ebuild,v 1.9 2010/04/15 10:04:27 the_paya Exp $

EAPI="4"
PYTHON_DEPEND="2:2.6"
SUPPORT_PYTHON_ABIS=1
RESTRICT_PYTHON_ABIS="2.[45] 3.*"

inherit distutils mercurial

DESCRIPTION="Random assortment of WSGI servers"
HOMEPAGE="http://trac.saddi.com/flup http://pypi.python.org/pypi/flup"
EHG_REPO_URI="http://hg.saddi.com/flup-server"
SRC_URI=""

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND=""
