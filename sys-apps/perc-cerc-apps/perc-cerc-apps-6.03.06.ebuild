# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit eutils

MY_PV="${PV:0:$[${#PV}-3]}-A${PV: -2}"
MY_P="${PN}-${MY_PV}"
DESCRIPTION="Dell PERC 3/QC, 3/DC, 3/DCL, 3/SC, 4/DC, 4/SC, 4/Di, CERC ATA 100 management applications"
HOMEPAGE="http://linux.dell.com/storage.shtml"
LICENSE="Dell"
KEYWORDS="~x86"
IUSE=""
SLOT="0"
SRC_URI="ftp://ftp.us.dell.com/scsi-raid/${MY_P}.tar.gz"
DEPEND="app-arch/rpm2targz
	app-arch/tar"

src_unpack() {
	unpack "${A}"
	cd "${WORKDIR}"
	rpm2targz Dellmgr-5.31-0.i386.rpm
	tar xfz Dellmgr-5.31-0.i386.tar.gz
	rpm2targz Megamon-4.0-0a.i386.rpm
	tar xfz Megamon-4.0-0a.i386.tar.gz
	rpm2targz linflash-3.01-0.i386.rpm
	tar xfz linflash-3.01-0.i386.tar.gz
	rpm2targz percsnmp-4.09-1.i386.rpm
	tar xfz percsnmp-4.09-1.i386.tar.gz
}

src_compile() {
	cd "${WORKDIR}/usr/sbin"
	mv dellmgr.bin dellmgr
	mv linflash.bin linflash
}

src_install () {
	pwd
	cd "${WORKDIR}"
	dodoc Dellmgr-changes.txt Megamon-changes.txt linflash-changes.txt
	dodoc percsnmp-changes.txt readme.txt

	insinto /usr/sbin
	insopts -m755
	cd "${WORKDIR}/usr/sbin"
	doins dellmgr MegaCt32 MegaServ linflash

	insinto /etc
	insopts -m644
	cd "${WORKDIR}/etc"
	doins megamon.conf
}
