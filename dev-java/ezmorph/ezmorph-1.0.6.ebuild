# Copyright 2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Simple Java library for transforming an Object to another Object"
HOMEPAGE="http://ezmorph.sourceforge.net/"
SRC_URI="mirror://sourceforge/ezmorph/${P}-sources.jar"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

COMMON_DEP="dev-java/commons-beanutils:1.7
	dev-java/commons-lang:2.1
	dev-java/commons-logging"
DEPEND=">=virtual/jdk-1.3.1
        ${COMMON_DEP}"
RDEPEND=">=virtual/jre-1.3.1
        ${COMMON_DEP}"

JAVA_GENTOO_CLASSPATH="commons-beanutils-1.7 commons-lang-2.1 commons-logging"

src_compile() {
	rm net/sf/ezmorph/test/ArrayAssertions.java
	java-pkg-simple_src_compile
}
