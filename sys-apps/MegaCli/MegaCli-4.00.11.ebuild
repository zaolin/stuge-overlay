# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit eutils

MY_PV="${PV:0:$[${#PV}-3]}-A${PV: -2}"
MY_P="${PN}-${MY_PV}"
DESCRIPTION="LSI Logic MegaRAID CLI management application"
HOMEPAGE="http://www.lsilogic.com/storage_home/products_home/internal_raid/megaraid_sas/megaraid_sas_8408e/index.html?remote=1"
LICENSE="LSI"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="0"
SRC_URI="http://www.lsi.com/DistributionSystem/AssetDocument/${PV}_Linux_MegaCLI.zip"
DEPEND="app-arch/unzip
	app-arch/rpm2targz
	app-arch/tar"

src_unpack() {
	unpack "${A}"
	cd "${WORKDIR}"
	unzip MegaCliLin.zip
	rpm2targz "MegaCli-${PV}-1.i386.rpm"
	tar xfz "MegaCli-${PV}-1.i386.tar.gz"
}

src_compile() {
	:
}

src_install () {
	cd "${WORKDIR}"
	dodoc "${PV}_Linux_MegaCLI.txt"

	cd "${WORKDIR}/opt/MegaRAID/${PN}"
	test "${ARCH}" = "amd64" &&
		newsbin MegaCli64 MegaCli ||
		dosbin MegaCli
}
