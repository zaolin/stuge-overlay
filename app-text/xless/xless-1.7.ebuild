# Copyright 2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit eutils

DESCRIPTION="Pager/file viewer similar to 'less' on the command line for X."
HOMEPAGE="http://www.ibiblio.org/pub/Linux/utils/file/"
SRC_URI="http://www.ibiblio.org/pub/Linux/utils/file/${P}.tgz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="x11-libs/libICE
	x11-libs/libX11
	x11-libs/libSM
	x11-libs/libXext
	x11-libs/libXt
	x11-libs/libXmu
	x11-libs/libXp
	x11-libs/libXpm
	x11-libs/libXaw"
DEPEND="${RDEPEND}
	x11-misc/imake"

src_unpack() {
	unpack "${A}"
	cd "${S}"
	epatch "${FILESDIR}/1.7-stdlib_mkstemp_intmain_strprotos__P.patch"
}

src_compile() {
	cd "${S}"
	xmkmf
	cd regexp
	xmkmf
	cd ..
	emake
}

src_install() {
	exeinto /usr/bin
	doexe xless
	insinto /usr/lib/X11
	doins xless.help
	mv xless.man xless.1
	doman xless.1
	dodoc CHANGES README TODO
}
