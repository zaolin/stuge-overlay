# Copyright 2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A java library for transforming objects to and from JSON"
HOMEPAGE="http://json-lib.sourceforge.net/"
SRC_URI="mirror://sourceforge/json-lib/${P}-jdk15-sources.jar"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="groovy ruby xml"

COMMON_DEP="dev-java/commons-beanutils:1.7
	>=dev-java/commons-collections-3.2
	>=dev-java/commons-lang-2.4
	>=dev-java/commons-logging-1.1.1
	>=dev-java/ezmorph-1.0.6
	groovy? ( >=dev-java/groovy-1.5.7 )
	ruby? ( >=dev-java/jruby-1.1 )
	xml? ( >=dev-java/xom-1.1 )"
DEPEND=">=virtual/jdk-1.5
        ${COMMON_DEP}"
RDEPEND=">=virtual/jre-1.5
        ${COMMON_DEP}"

JAVA_GENTOO_CLASSPATH="commons-beanutils-1.7 commons-lang-2.1 commons-logging"

src_compile() {
	rm net/sf/json/test/JSONAssert.java
	java-pkg-simple_src_compile
}
