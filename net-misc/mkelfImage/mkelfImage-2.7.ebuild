# Copyright 2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit subversion

EAPI="1"
DESCRIPTION="Create network bootable ELF image not using BIOS calls from Linux kernel"
HOMEPAGE="http://coreboot.org/Mkelfimage"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

ESVN_REPO_URI="svn://coreboot.org/repos/trunk/util/mkelfImage"

RDEPEND=""
DEPEND="${RDEPEND}"

src_compile() {
	econf --with-i386
	emake
}

src_install() {
	dobin objdir/sbin/mkelfImage
	doman objdir/man/man8/mkelfImage.8
}
