EAPI=4

DESCRIPTION="A simple password manager using the Gnome (maybe also KDE-Wallet) keyring to store the passwords."
HOMEPAGE="https://launchpad.net/gkpm"
SRC_URI="https://launchpad.net/gkpm/trunk/0.8/+download/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="gtk keybinder libnotify"

REQUIRED_USE="keybinder? ( gtk )
	libnotify? ( gtk )"

DEPEND=""
RDEPEND="=dev-lang/python-2*
	dev-python/keyring
	dev-python/gnome-keyring-python
	gtk? ( =dev-python/pygtk-2* )
	keybinder? ( dev-libs/keybinder[python] )
	libnotify? ( dev-python/notify-python )"

RESTRICT="strip binchecks"

S="${WORKDIR}/${PN}"

src_install() {
	dodir /usr/lib/"${PN}"
	insinto /usr/lib/"${PN}"
	doins gkpm.py

	newbin "${FILESDIR}"/gkpm-r1 gkpm

	dodoc README
}
