EAPI=6
PYTHON_COMPAT=( python{2_6,2_7} )

inherit eutils

DESCRIPTION="Library and tool for personalization of Yubico's YubiKey NEO"
SRC_URI="https://developers.yubico.com/yubioath-desktop/releases/${P}.tar.gz"
HOMEPAGE="https://developers.yubico.com/yubioath-desktop/"

KEYWORDS="~amd64 ~x86"
SLOT="0"
LICENSE="BSD-2"

IUSE="X"

inherit distutils-r1

RDEPEND="app-crypt/ccid
	 dev-python/pycrypto
	 dev-python/pyscard
	 dev-python/pbkdf2
	 dev-python/pyusb
	 X? ( dev-python/pyside dev-python/pyside-tools )
	 dev-python/click
	 dev-python/setuptools"

DEPEND="${RDEPEND}"

src_prepare()
{
	if ! use X; then
		rm -rf yubioath/gui
		sed -e "/'gui_scripts':/d" -i setup.py
	fi

	distutils-r1_src_prepare
}

src_install()
{
	if use X; then
		domenu resources/yubioath.desktop  || die
		doicon resources/yubioath.xpm || die
	fi

	distutils-r1_src_install || die
}
