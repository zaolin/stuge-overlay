# Copyright 2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit java-pkg-2 java-pkg-simple

EAPI="2"
DESCRIPTION="Web-based collaborative word processor"
HOMEPAGE="http://etherpad.org/"
SRC_URI="https://github.com/ether/pad/tarball/releases-1.1 -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

COMMON_DEP=">=dev-lang/scala-2.7.7
	!>=dev-lang/scala-2.8
	dev-java/jdbc-mysql
	>=dev-java/dnsjava-2.0.6
	>=dev-java/jBCrypt-0.3
	>=dev-java/jcommon-1.0.15
	>=dev-java/jfreechart-1.0.12
	>=dev-java/c3p0-0.9.1.2
	dev-java/commons-beanutils:1.7
	>=dev-java/commons-collections-3.2.1
	>=dev-java/commons-fileupload-1.2.1
	>=dev-java/commons-io-1.4
	dev-java/commons-lang:2.1
	>=dev-java/commons-logging-1.1.1
	>=dev-java/derby-10.5.1.1
	>=dev-java/ezmorph-1.0.6
	>=www-servers/jetty-6.1.20
	>=dev-java/json-lib-2.3
	>=app-office/openoffice-3.2.0[odk]
	>=dev-java/rhino-1.7
	>=java-virtuals/servlet-api-2.5
	>=dev-java/tagsoup-1.2
	>=dev-java/yuicompressor-2.4"

RDEPEND=">=virtual/jre-1.6
	${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.6
	${COMMON_DEP}"

JAVA_GENTOO_CLASSPATH="commons-beanutils-1.7 commons-lang-2.1 commons-logging"

src_compile() {
	java-pkg-simple_src_compile
}

src_install() {
	java-pkg-simple_src_install
}
