# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit eutils

DESCRIPTION="Header files for Oracle Instantclient"
HOMEPAGE="http://www.oracle.com/"
SRC_URI="http://www.oracle.com/technology/products/ias/ohs/htdocs/ociheaders.tar"

LICENSE="oracle-jdbc"
SLOT="0"
KEYWORDS="~x86 ~amd64"
RESTRICT="nomirror"

DEPEND=""

src_unpack() {
	unpack "${A}"
	epatch "${FILESDIR}/${P}-define_oci_nls_charset_id.patch"
}

src_compile() {
	einfo "No compilation neccessary"
}


src_install() {
	cd "${WORKDIR}"
	insinto /usr/include
	doins *.h
}
