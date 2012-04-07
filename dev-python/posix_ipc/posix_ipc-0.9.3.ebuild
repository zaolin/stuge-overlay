# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/xsv/xsv-2.7.ebuild,v 1.6 2009/01/08 21:09:51 patrick Exp $

EAPI="3"
PYTHON_DEPEND="*:2.4"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="2.[0123]"

inherit distutils

DESCRIPTION="POSIX IPC for Python - Semaphores, Shared Memory and Message Queues"
SRC_URI="http://semanchuk.com/philip/posix_ipc/${P}.tar.gz"
HOMEPAGE="http://semanchuk.com/philip/posix_ipc/"

KEYWORDS="~amd64 ~x86"
SLOT="0"
LICENSE="GPL-3"
IUSE="examples"

src_install() {
	distutils_src_install

	insinto /usr/share/doc/${PF}
	doins README ReadMe.html history.html

	use examples && {
		insinto /usr/share/doc/${PF}/demo_shm_example
		doins demo/{ReadMe.txt,{utils,premise,conclusion}.py}
		insinto /usr/share/doc/${PF}/demo2_mq_example
		doins demo2/{ReadMe.txt,{utils,premise,conclusion}.py}
		insinto /usr/share/doc/${PF}/demo3_mq_notification_example
		doins demo3/{ReadMe.txt,{utils,cleanup,{one_shot,repeating}_{signal,thread}}.py}
	}
}
