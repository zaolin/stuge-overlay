# Copyright 2014 Peter Stuge
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5
inherit eutils

DESCRIPTION="C program to detect network interface link state"
HOMEPAGE="https://git.stuge.se/waitlink.git"
SRC_URI="https://git.stuge.se/?p=${PN}.git;a=snapshot;h=refs/tags/${PV};sf=tbz2 -> ${P}.tar.bz2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	"

src_compile() {
	emake
}

src_install() {
	dobin waitlink
}
