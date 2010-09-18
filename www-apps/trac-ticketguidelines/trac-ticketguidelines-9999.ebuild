# Copyright 2010 Peter Stuge
# $Header$

inherit distutils

ESVN_REPO_URI="https://svn.mayastudios.de/mtpp/repos/plugins/ticketguidelines/trunk"
inherit subversion
SRC_URI=""

DESCRIPTION="Trac Ticket Guidelines Plugin"
HOMEPAGE="https://svn.mayastudios.de/mtpp/wiki/Plugins/TicketGuidelinesPlugin"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=www-apps/trac-0.11"
DEPEND="${RDEPEND}
	dev-python/setuptools"
