# Copyright 2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A Java implementation of OpenBSD's Blowfish password hashing code"
HOMEPAGE="http://www.mindrot.org/projects/jBCrypt/"
SRC_URI="http://www.mindrot.org/files/jBCrypt/${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=virtual/jdk-1.4"
RDEPEND=">=virtual/jre-1.4"

S="${WORKDIR}/${P}"

src_compile() {
	rm TestBCrypt.java
	java-pkg-simple_src_compile
}

src_install() {
	java-pkg-simple_src_install
	dodoc README TODO || die
}
