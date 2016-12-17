# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 user

DESCRIPTION="Updater daemon for TwoDNS"
HOMEPAGE="https://github.com/tablet-mode/twod"
SRC_URI="https://github.com/tablet-mode/twod/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}
	>=dev-python/lockfile-0.9.1[${PYTHON_USEDEP}]
	>=dev-python/python-daemon-1.6[${PYTHON_USEDEP}]
	>=dev-python/requests-1.2.3[${PYTHON_USEDEP}]"

src_install() {
	newinitd ${FILESDIR}/runscript twod

	dodir /usr/lib/"${PN}"
	insinto /usr/lib/"${PN}"
	doins twod/twod.py
	doins twod/_version.py

	newbin ${FILESDIR}/bin.sh twod

	doman man/twod.8
	doman man/twodrc.5

	dodoc README.rst

	insinto /usr/share/doc/${PF}/examples
	doins docs/examples/twodrc.example
}

pkg_preinst() {
	enewgroup twod
	enewuser twod -1 -1 /var/empty twod
}
