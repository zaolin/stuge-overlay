# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-devel/libtool/libtool-9999.ebuild,v 1.4 2009/09/13 14:46:53 flameeyes Exp $

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="git://git.savannah.gnu.org/libtool.git"
	inherit git
	SRC_URI=""
else
	SRC_URI="mirror://gnu/${PN}/${P}.tar.bz2"
fi

DESCRIPTION="A shared library tool for developers"
HOMEPAGE="http://www.gnu.org/software/libtool/"

LICENSE="GPL-2"
SLOT="1.5"
KEYWORDS=""
IUSE=""

RDEPEND="sys-devel/gnuconfig
	>=sys-devel/autoconf-2.62
	>=sys-devel/automake-1.10.1"
DEPEND="${RDEPEND}
	sys-apps/help2man"

src_unpack() {
	if [[ ${PV} == "9999" ]] ; then
		git_src_unpack
		cd "${S}"
		./bootstrap || die
	else
		unpack ${A}
		cd "${S}"
	fi
	export CONFIG_SHELL=/bin/bash
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc AUTHORS ChangeLog* NEWS README THANKS TODO doc/PLATFORMS

	local x
	for x in libtool libtoolize ; do
		help2man ${x} > ${x}.1
		doman ${x}.1 || die
	done

	for x in $(find "${D}" -name config.guess -o -name config.sub) ; do
		rm -f "${x}" ; ln -sf /usr/share/gnuconfig/${x##*/} "${x}"
	done
}

pkg_preinst() {
	preserve_old_lib /usr/$(get_libdir)/libltdl.so.3
}

pkg_postinst() {
	preserve_old_lib_notify /usr/$(get_libdir)/libltdl.so.3
}
