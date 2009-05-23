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
SRC_URI="http://www.lsi.com/DistributionSystem/AssetDocument/support/downloads/megaraid/miscellaneous/linux/${PV}_Linux_Cli.zip"
DEPEND="app-arch/unzip
	app-arch/rpm2targz
	app-arch/tar"

src_unpack() {
	unpack "${A}"
	cd "${WORKDIR}"
	rpm2targz "MegaCli-${PV}-0.i386.rpm"
	tar xfz "MegaCli-${PV}-0.i386.tar.gz"
}

src_compile() {
	:
}

src_install () {
	cd "${WORKDIR}"
	dodoc "${PV}_Linux_Cli.txt"

	insinto /usr/sbin
	insopts -m 755
	cd "${WORKDIR}/opt/MegaRAID/${PN}"
	doins MegaCli
}
