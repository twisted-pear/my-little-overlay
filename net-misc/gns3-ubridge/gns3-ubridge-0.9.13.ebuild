EAPI=6

inherit fcaps

DESCRIPTION="Bridge for UDP tunnels, Ethernet, TAP and VMnet interfaces."
HOMEPAGE="https://github.com/GNS3/ubridge"
SRC_URI="https://github.com/GNS3/ubridge/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
KEYWORDS="~x86 ~amd64"
SLOT="0"
IUSE=""

DEPEND="net-libs/libpcap"
RDEPEND="${DEPEND}"

FILECAPS=(
	cap_net_admin,cap_net_raw=ep /usr/bin/ubridge
)

S="${WORKDIR}/ubridge-${PV}"

src_install() {
	dobin ubridge
}
