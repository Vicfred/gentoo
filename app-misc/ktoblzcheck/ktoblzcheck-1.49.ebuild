# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 )
inherit python-single-r1

DESCRIPTION="Library to check account numbers and bank codes of German banks"
HOMEPAGE="http://ktoblzcheck.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 ~ppc ~ppc64 ~sparc x86"
IUSE="python"

REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

RDEPEND="
	app-text/recode
	sys-apps/grep
	sys-apps/sed
	virtual/awk
	|| ( net-misc/wget www-client/lynx )
	python? ( ${PYTHON_DEPS} )
"
DEPEND="${RDEPEND}
	sys-devel/libtool
"

DOCS=( AUTHORS ChangeLog NEWS README )

pkg_setup() {
	use python && python-single-r1_pkg_setup
}

src_configure() {
	econf $(use_enable python)
}

src_install() {
	default
	find "${D}" -name '*.la' -type f -delete || die
}
