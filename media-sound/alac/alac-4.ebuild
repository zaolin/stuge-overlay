# Copyright 2013 Peter Stuge <peter@stuge.se>
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI="5"

inherit subversion

DESCRIPTION="Apple Lossless Audio Codec"
HOMEPAGE="http://alac.macosforge.org/"
SRC_URI=""

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

ESVN_REPO_URI="http://svn.macosforge.org/repository/alac/trunk@4"

RDEPEND=""
DEPEND="${RDEPEND}"

src_prepare() {
	epatch "${FILESDIR}/r4-convert-utility-makefile-libs.patch"
}

src_compile() {
	cd "${S}/convert-utility"
	emake
}

src_install() {
	dolib codec/libalac.a
	dobin convert-utility/alacconvert
}
