EAPI=5

DESCRIPTION="Tool for interacting with the PIV applet on the YubiKey NEO"
SRC_URI="https://developers.yubico.com/yubico-piv-tool/Releases/${P}.tar.gz"
HOMEPAGE="https://developers.yubico.com/yubico-piv-tool/"

KEYWORDS="~amd64 ~x86"
SLOT="0"
LICENSE="BSD-2"
IUSE=""

RDEPEND="sys-apps/pcsc-lite"
DEPEND="${RDEPEND}
	virtual/pkgconfig"
