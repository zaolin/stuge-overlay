inherit eutils

MY_PV="${PV/_pre/-pre}"
S="${WORKDIR}/${PN}-${MY_PV}"

DESCRIPTION="Quick Image Viewer"
HOMEPAGE="http://www.klografx.net/qiv/"
SRC_URI="http://www.klografx.net/qiv/download/${PN}-${MY_PV}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="xinerama"

RDEPEND="media-libs/imlib
	<x11-libs/gtk+-2"
DEPEND="${RDEPEND}
	>sys-apps/sed-4
	"

pkg_setup() {
	built_with_use --missing true media-libs/imlib gtk || {
		eerror ""
		eerror "qiv requires media-libs/imlib to be built with the gtk use flag"
		die "Missing gtk USE flag on media-libs/imlib"
	}
}

src_compile() {
	sed -i '/^PREFIX/s,/usr/local,/usr,' Makefile
	use xinerama && sed -i '/^GTD_XINERAMA/s,^,#,' Makefile
	emake
}

src_install() {
	exeinto /usr/bin
	exeopts -m 755
	doexe qiv
	doman qiv.1
}
