# Copyright 2013 Peter Stuge

EAPI="4"
inherit git-2

DESCRIPTION="Userspace access to USB devices"
HOMEPAGE="http://libusb.sourceforge.net/"
SRC_URI=""

LICENSE="LGPL-2"
SLOT="1"
KEYWORDS=""
IUSE=""

EGIT_REPO_URI="git://git.stuge.se/libusb.git"
EGIT_BOOTSTRAP="autogen.sh"

RDEPEND=""
DEPEND=""

src_install() {
	emake DESTDIR="${D}" install || die "make install failed"
	dodoc AUTHORS NEWS README THANKS TODO PORTING || die "dodoc failed"
}
