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
	epatch "${FILESDIR}/ociheaders-0.1-define_oci_nls_charset_id.patch"
}

src_compile() {
	einfo "No compile needed"
}

src_install() {
	cd "${WORKDIR}"
	ver="$(cd /usr/lib/oracle;ls -d *|grep '^[[:digit:].]\+$'|head -n 1)"
	einfo "Found instant client version ${ver}"
	insinto "/usr/include/oracle/${ver}/client"
	doins *.h
}
