# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit eutils apache-module

DESCRIPTION="Apache2 DSO for finding visitor's country and city in a GeoIP database."
HOMEPAGE="http://www.maxmind.com/app/mod_geoip"
SRC_URI="http://www.maxmind.com/download/geoip/api/mod_geoip2/mod_geoip2_1.1.8.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND=">=dev-libs/geoip-1.3.4"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}_${PV}"

APACHE2_MOD_CONF="50_${PN}"
APACHE2_MOD_DEFINE="GeoIP"

need_apache2

src_unpack() {
	unpack "${A}" || die
	mv "${S}/mod_geoip.c" "${S}/mod_geoip2.c" || die
}

src_compile() {
	apxs2 -lGeoIP -c mod_geoip2.c
}
