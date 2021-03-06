# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/genshi/genshi-0.5.1.ebuild,v 1.10 2010/02/08 08:49:44 pva Exp $

EAPI="2"
SUPPORT_PYTHON_ABIS="1"

inherit eutils distutils

MY_P="Genshi-${PV}"

DESCRIPTION="Python toolkit for stream-based generation of output for the web."
HOMEPAGE="http://genshi.edgewall.org/"
SRC_URI="http://ftp.edgewall.com/pub/genshi/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ppc ~ppc64 ~sparc x86 ~amd64-linux ~x86-linux ~x86-macos"
IUSE="doc examples"

DEPEND="dev-python/setuptools"
RDEPEND="${DEPEND}"
RESTRICT_PYTHON_ABIS="3.*"

S="${WORKDIR}/${MY_P}"

src_test() {
	testing() {
		"$(PYTHON)" setup.py test
	}
	python_execute_function testing
}

src_install() {
	distutils_src_install

	if use doc; then
		dodoc doc/*.txt
		dohtml -r doc/*
	fi

	if use examples; then
		insinto /usr/share/doc/${PF}
		doins -r examples
	fi
}
