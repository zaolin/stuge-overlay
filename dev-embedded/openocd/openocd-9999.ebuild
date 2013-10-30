# Copyright 2013 Peter Stuge
# Distributed under the terms of the GNU General Public License v2

EAPI=4

EGIT_REPO_URI="http://openocd.zylin.com/p/openocd"
inherit eutils
if [[ ${PV} == "9999" ]] ; then
	inherit git-2 autotools
	#KEYWORDS=""
	SRC_URI=""
else
	KEYWORDS="~amd64 ~x86"
	SRC_URI="mirror://berlios/${PN}/${P}.tar.gz"
fi

DESCRIPTION="OpenOCD - Open On-Chip Debugger"
HOMEPAGE="http://openocd.berlios.de/web/"

LICENSE="GPL-2"
SLOT="0"
IUSE="ftd2xx ftdi parport presto usb blaster versaloon"
RESTRICT="strip" # includes non-native binaries

# libftd2xx is the default because it is reported to work better.
DEPEND="dev-lang/jimtcl
	usb? ( dev-libs/libusb )
	presto? ( dev-embedded/libftd2xx )
	ftd2xx? ( dev-embedded/libftd2xx )
	ftdi? ( dev-embedded/libftdi )"
RDEPEND="${DEPEND}"

pkg_setup() {
	if use ftdi && use ftd2xx ; then
		ewarn "You can only use one FTDI library at a time, so picking"
		ewarn "USE=ftdi (open source) over USE=ftd2xx (closed source)"
	fi
}

src_unpack() {
	if [[ ${PV} == "9999" ]] ; then
		git_src_unpack
		cd "${S}"
		AT_NO_RECURSIVE=yes eautoreconf
	else
		unpack ${A}
	fi
}

src_compile() {
	if [[ ${PV} == "9999" ]] ; then
		myconf="${myconf} --enable-maintainer-mode"
		myconf="${myconf} --disable-internal-jimtcl"
	fi

	econf \
		--disable-werror \
		--enable-amtjtagaccel \
		--enable-ep93xx \
		--enable-at91rm9200 \
		--enable-gw16012 \
		--enable-oocd_trace \
		$(use_enable usb usbprog) \
		$(use_enable parport) \
		$(use_enable presto presto_ftd2xx) \
		$(use_enable ftdi ft2232_libftdi) \
		$(use_enable blaster usb_blaster_libftdi) \
		$(use_enable versaloon vsllink) \
		$(use ftdi || use_enable ftd2xx ft2232_ftd2xx) \
		${myconf}
	emake || die "Error in emake!"
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc AUTHORS ChangeLog NEWS README TODO
	prepstrip "${D}"/usr/bin
}
