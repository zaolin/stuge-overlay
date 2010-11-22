# Copyright 2010 Gentoo Foundation

inherit git autotools

EAPI="1"
DESCRIPTION="Utility functions for Open Source mobile communications"
HOMEPAGE="http://bb.osmocom.org/trac/wiki/libosmocore"
SRC_URI=""

LICENSE="GPL-2"
SLOT="1"
KEYWORDS="~amd64 ~x86"
IUSE=""

EGIT_REPO_URI="git://git.osmocom.org/libosmocore.git"
EGIT_BOOTSTRAP="eautoreconf"

src_install() {
	emake DESTDIR="${D}" install || die "make install failed"
}
