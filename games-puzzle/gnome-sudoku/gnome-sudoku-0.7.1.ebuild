# Copyright 2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

NEED_PYTHON=2.4
inherit python

PYPN="${PN/-/_}"
DESCRIPTION="Generate and solve or print Sudoku puzzles."
HOMEPAGE="http://gnome-sudoku.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=dev-util/intltool-0.7.0
	sys-devel/gettext
	>=gnome-base/gconf-2
	dev-python/imaging
	dev-python/pygtk
	dev-python/gnome-python
	dev-python/gnome-python-desktop
	dev-python/numeric
	>=x11-libs/gtk+-2.8"
RDEPEND="${DEPEND}"

src_install() {
	make install DESTDIR="${D}"
}

pkg_postinst() {
	python_version
	python_mod_optimize "${ROOT}usr/$(get_libdir)/python${PYVER}/site-packages/${PYPN}"
}

pkg_postrm() {
	python_mod_cleanup
}
