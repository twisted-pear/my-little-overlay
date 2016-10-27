EAPI=5

DESCRIPTION="Tool for interacting with the PIV applet on a YubiKey"
SRC_URI="https://developers.yubico.com/yubico-piv-tool/Releases/${P}.tar.gz"
HOMEPAGE="https://developers.yubico.com/yubico-piv-tool/"

KEYWORDS="~amd64 ~x86"
SLOT="0"
LICENSE="BSD-2"
IUSE=""

RDEPEND="app-crypt/ccid
	dev-libs/openssl
	sys-apps/pcsc-lite"
DEPEND="${RDEPEND}
	virtual/pkgconfig"
