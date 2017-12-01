# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )

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
	>=dev-python/python-daemon-2.1.1[${PYTHON_USEDEP}]
	>=dev-python/requests-2.18.2[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '>=dev-python/configparser-3.5.0[${PYTHON_USEDEP}]' 'python2*' )"

src_prepare() {
	sed -e "s/'python-daemon==2.1.2'/'python-daemon>=2.1.1'/" -i setup.py
	sed -e "s/'requests==2.18.4'/'requests>=2.18.2'/" -i setup.py
	sed -e "/'configparser==3.5.0',/d" -i setup.py

	default
}

python_install_all() {
	newinitd ${FILESDIR}/runscript twod

	doman man/twod.8
	doman man/twodrc.5

	dodoc README.rst

	insinto /usr/share/doc/${PF}/examples
	doins docs/examples/twodrc.example

	insinto /etc
	newins docs/examples/twodrc.example twodrc

	distutils-r1_python_install_all
}

pkg_preinst() {
	enewgroup twod
	enewuser twod -1 -1 /var/empty twod
}
