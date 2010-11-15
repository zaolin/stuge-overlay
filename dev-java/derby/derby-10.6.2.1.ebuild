# Copyright 2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

JAVA_PKG_IUSE="doc"
WANT_ANT_TASKS="ant-nodeps"

inherit java-pkg-2 java-ant-2

DESCRIPTION="An open source relational database implemented entirely in Java"
HOMEPAGE="http://db.apache.org/derby/"
SRC_URI="http://archive.apache.org/dist/db/derby/db-${P}/db-${P}-src.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

COMMON_DEP=""
DEPEND=">=virtual/jdk-1.5
        ${COMMON_DEP}"
RDEPEND=">=virtual/jre-1.5
        ${COMMON_DEP}"

S="${WORKDIR}/db-${P}-src"

EANT_BUILD_TARGET="buildsource cleanjars initjars derbyjar derbytoolsjar derbynetjar derbyclientjar derbyrunjar demo"
EANT_DOC_TARGET="javadoc"

src_install() {
	for jar in "" client net run tools; do
		java-pkg_dojar "jars/sane/${PN}${jar}.jar"
	done
	java-pkg_dolauncher derbynet --jar derbynet.jar
	java-pkg_dolauncher derbyrun --jar derbyrun.jar
}
