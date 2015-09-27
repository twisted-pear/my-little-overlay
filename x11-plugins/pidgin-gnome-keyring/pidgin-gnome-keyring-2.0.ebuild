EAPI=5
inherit eutils

DESCRIPTION="Stores Pidgin account passwords in the gnome keyring"
HOMEPAGE="https://github.com/aebrahim/pidgin-gnome-keyring/"
SRC_URI="https://github.com/aebrahim/pidgin-gnome-keyring/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="app-crypt/libsecret
	net-im/pidgin[gtk]"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	epatch ${FILESDIR}/${PN}_cflags-fix.patch
}
