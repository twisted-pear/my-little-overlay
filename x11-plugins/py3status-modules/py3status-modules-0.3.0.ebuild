EAPI=5

DESCRIPTION="Collection of modules for py3status"
HOMEPAGE="https://github.com/tablet-mode/py3status-modules"
SRC_URI="https://github.com/tablet-mode/py3status-modules/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="alsa battery examples mpd +task"

DEPEND=""
RDEPEND=">=dev-lang/python-3.2
	>=x11-misc/py3status-2.0
	alsa? ( >=media-sound/alsa-utils-1.0.28 )
	mpd? ( >=dev-python/python-mpd-0.5.1 )
	battery? ( || ( >=sys-power/upower-0.9.23
                >=sys-power/upower-pm-utils-0.9.23 )
	        >=dev-python/dbus-python-1.2.0 )
	task? ( >=app-misc/task-2.1.2 )"

RESTRICT="strip binchecks"

src_compile() {
	return
}

src_install() {
	dodoc README.rst
	dodoc docs/changelog.rst
	dodoc docs/configuration.rst
	dodoc docs/installation.rst
	dodoc docs/modules.rst

	if use examples; then
		insinto /usr/share/doc/${PF}/examples
		doins docs/examples/i3status.conf.example
	fi

	dodir /usr/share/"${PN}"
	insinto /usr/share/"${PN}"

	doins mailstatus/mailstatus.py
	use alsa && doins alsastatus/alsastatus.py
	use battery && doins batterystatus/batterystatus.py
	use mpd && doins mpdstatus/mpdstatus.py
	use task && doins taskstatus/taskstatus.py
}
