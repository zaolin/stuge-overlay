# Copyright 2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit eutils

DESCRIPTION="A library for storing and manipulating TAI64 dates and times."
HOMEPAGE="http://cr.yp.to/libtai.html"
SRC_URI="http://cr.yp.to/libtai/libtai-0.60.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	"
DEPEND="${RDEPEND}
	"

src_unpack() {
	unpack "${A}"
	cd "${S}"
	epatch "${FILESDIR}/0.60-nostrip.patch"
	epatch "${FILESDIR}/0.60-implicit_warnings.patch"
}

src_compile() {
	cd "${S}"
	emake
}

src_install() {
	insinto /etc
	doins leapsecs.dat
	insinto /usr/include
	doins caldate.h caltime.h leapsecs.h tai.h taia.h uint64.h
	insinto /usr/lib
	doins libtai.a
	exeinto /usr/bin
	doexe easter yearcal nowutc
	doman tai.3 tai_now.3 tai_pack.3 taia.3 taia_now.3 taia_pack.3
	doman caldate.3 caldate_mjd.3 caltime.3 caltime_tai.3
	doman leapsecs.3
}
