# Copyright 2014 Peter Stuge
# Distributed under the terms of the GNU General Public License v2

EAPI=5

EGIT_REPO_URI="https://github.com/prpplague/${PN}"
inherit eutils
if [[ ${PV} == "9999" ]] ; then
	inherit git-2
	SRC_URI=""
else
	KEYWORDS="~amd64 ~x86"
	SRC_URI="${EGIT_REPO_URI}/archive/v${PV}.zip"
fi

DESCRIPTION="Test suite for Linux framebuffer"
HOMEPAGE="https://github.com/prpplague/fb-test-app"

LICENSE="GPL-2"
SLOT="0"
IUSE=""
RESTRICT=""

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	if [[ ${PV} == "9999" ]] ; then
		git_src_unpack
	else
		unpack "${A}"
	fi
}

src_compile() {
	emake || die "Error in emake!"
}

src_install() {
	dobin fb-string fb-test offset perf rect
	prepstrip "${D}"/usr/bin
}
