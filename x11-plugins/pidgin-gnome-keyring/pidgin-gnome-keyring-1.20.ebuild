EAPI=5
inherit eutils

DESCRIPTION="Stores Pidgin account passwords in the gnome keyring"
HOMEPAGE="https://code.google.com/p/pidgin-gnome-keyring/"
SRC_URI="https://pidgin-gnome-keyring.googlecode.com/files/${P}_src.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="gnome-base/gnome-keyring
	x11-libs/gtk+:2
	net-im/pidgin[gtk]"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	epatch ${FILESDIR}/${PN}_build-fix.patch
}
