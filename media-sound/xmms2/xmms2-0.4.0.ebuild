# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MY_PV="0.4DrKosmos"

DESCRIPTION="X-platform Music Multiplexing System 2"
HOMEPAGE="http://wiki.xmms2.xmms.se/index.php/Main_Page"
SRC_URI="mirror://sourceforge/xmms2/xmms2-${MY_PV}.tar.bz2"

LICENSE="GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="aac alsa ao avahi cli coreaudio curl cxx fam flac gnome jack mad mms modplug mp4 musepack ofa perl pulseaudio python resid rss ruby samba shout sid speech vorbis wma xml"

DEPEND=">=dev-lang/python-2.3
	>=dev-libs/glib-2.8
	>=dev-db/sqlite-3.2.4
	aac? ( media-libs/faad2 )
	alsa? ( media-libs/alsa-lib )
	ao? ( media-libs/libao )
	avahi? ( net-dns/avahi )
	curl? ( >=net-misc/curl-7.11.2 )
	cxx? ( dev-libs/boost dev-cpp/glibmm )
	fam? ( app-admin/gamin )
	flac? ( media-libs/flac )
	gnome? ( gnome-base/gnome-vfs )
	jack? ( media-sound/jack )
	mad? ( media-libs/libmad )
	mms? ( media-libs/libmms )
	modplug? ( media-libs/libmodplug )
	mp4? ( media-video/ffmpeg )
	musepack? ( media-libs/libmpcdec )
	ofa? ( media-libs/libofa )
	perl? ( dev-lang/perl )
	pulseaudio? ( media-sound/pulseaudio )
	resid? ( media-libs/resid )
	ruby? ( >=dev-lang/ruby-1.8 )
	samba? ( net-fs/samba )
	shout? ( media-libs/libshout )
	sid? ( >=media-libs/libsidplay-2.0 )
	speech? ( >=sci-libs/fftw-3.0 media-libs/libsamplerate )
	vorbis? ( media-libs/libvorbis )
	wma? ( media-video/ffmpeg )
	xml? ( dev-libs/libxml2 )"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-${MY_PV}"

disable_plugins() {
	local disable_plugins x

	# that one should never work (and we need a non-empty $disable_plugins)
	disable_plugins="waveout"

	for x in alsa aac:faad avahi:daap ao coreaudio curl flac gnome:gnomevfs jack mad mms modplug mp4:avformat musepack ofa rss samba shout:ices sid speech:vocoder vorbis xml:xspf ; do
		if ! use ${x/:*} ; then
			disable_plugins="${disable_plugins},${x/*:}";
		fi
	done

	echo ${disable_plugins}
}

enable_optionals() {
	local enable_optionals x

	# that one should always work (and we need a non-empty $enable_optionals)
	enable_optionals="launcher"

	for x in avahi cli gnome:dns_sd cxx:xmmsclient++,xmmsclient++-glib fam:medialib-updater perl python ruby ; do
		if use ${x/:*} ; then
			enable_optionals="${enable_optionals},${x/*:}";
		fi
	done

	echo ${enable_optionals}
}

src_compile() {
	./waf configure --without-plugins "$(disable_plugins)" \
					--with-optionals "$(enable_optionals)" \
					--prefix /usr \
					|| die "configure failed"
	./waf build -p -j1 || die "build failed"
}

src_install() {
	./waf --destdir ${D} -j1 install
	dodoc AUTHORS COPYING COPYING.GPL COPYING.LGPL README TODO
}

