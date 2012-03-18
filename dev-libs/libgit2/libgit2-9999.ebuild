# Copyright 2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit git-2 cmake-utils multilib

DESCRIPTION="A linkable library for Git"
HOMEPAGE="http://libgit2.github.com/"

EGIT_REPO_URI="https://github.com/${PN}/${PN}.git"

LICENSE="GPL-2-with-linking-exception"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples test"

RDEPEND="sys-libs/zlib"
DEPEND="${RDEPEND}"

DOCS=( README.md )

src_unpack() {
	git-2_src_unpack
}

src_configure() {
	local mycmakeargs=(
		-DINSTALL_LIB=/usr/$(get_libdir)
		$(cmake-utils_use_build test TESTS)
	)
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install

	if use examples ; then
		docinto examples
		dodoc examples/*
	fi
}
