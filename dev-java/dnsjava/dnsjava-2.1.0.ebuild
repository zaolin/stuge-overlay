# Copyright 2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

JAVA_PKG_IUSE="doc"

inherit java-pkg-2 java-ant-2

DESCRIPTION="An implementation of DNS in Java"
HOMEPAGE="http://www.dnsjava.org/"
SRC_URI="http://www.dnsjava.org/download/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=virtual/jdk-1.4"
RDEPEND=">=virtual/jre-1.4"

EANT_BUILD_TARGET="jar"
EANT_DOC_TARGET="docs"

src_install() {
	java-pkg_newjar "${P}.jar"

	dodoc README USAGE || die
	use doc && java-pkg_dojavadoc doc
}
