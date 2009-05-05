# Copyright 2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit eutils

MY_P="${PN}-0.1DR1.1"
DESCRIPTION="X(cross)platform Music Multiplexing System. Next-gen audio player."
HOMEPAGE="http://wiki.xmms2.xmms.se/"
SRC_URI="mirror://sourceforge/xmms2/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="curl ogg vorbis alsa sid python ruby flac gnome jack modplug samba speex sdl"

S="${WORKDIR}/${MY_P}"

RDEPEND="
	>=dev-libs/glib-2.2
	media-libs/libmad
	>=dev-db/sqlite-3.2
	curl? ( >=net-misc/curl-7.11.2 )
	ogg||vorbis? ( media-libs/libvorbis )
	alsa? ( >=media-libs/alsa-lib-1.0 )
	sid? ( >=media-libs/libsidplay-2.0
		>=media-libs/resid-0.13 )
	flac? ( >=media-libs/flac-1.1.1 )
	gnome? ( gnome-base/gnome-vfs )
	jack? ( media-sound/jack-audio-connection-kit )
	modplug? ( media-libs/libmodplug )
	samba? ( >=net-fs/samba-3.0 )
	speex? ( media-libs/speex )
	sdl? ( media-libs/libsdl )
	"

DEPEND="${RDEPEND}
	>=dev-lang/python-2.2.0
	>=dev-util/scons-0.94
	python? ( >=dev-python/pyrex-0.9.3 )
	ruby? ( >=dev-lang/ruby-1.8 )
	"

src_compile() {
	scons INSTALLDIR="${D}" PREFIX="/usr" "${MAKEOPTS}" SYSCONFDIR="/etc"
}

src_install() {
	scons install
	dodoc AUTHORS ChangeLog COPYING TODO README
}
