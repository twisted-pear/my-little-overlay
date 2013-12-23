EAPI=5

DESCRIPTION="Collection of modules for py3status"
HOMEPAGE="https://github.com/tablet-mode/py3status-modules"
SRC_URI="https://github.com/tablet-mode/py3status-modules/tarball/${PV} -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="examples mpd"

DEPEND=""
RDEPEND=">=dev-lang/python-3.2
	>=x11-misc/py3status-1.1
	mpd? ( >=dev-python/python-mpd-0.5.1 )"

RESTRICT="strip binchecks"

S="${WORKDIR}"

src_install() {
	local dir=*-py3status-modules-*
	cd ${dir}

	rm .gitignore
	rm LICENSE

	dodoc README.rst

	if use examples; then
		insinto /usr/share/doc/${PF}/examples
		doins modules.ini.example
	fi

	dodir /usr/share/"${PN}"
	insinto /usr/share/"${PN}"

	doins mailstatus/mailstatus.py
	doins taskstatus/taskstatus.py
	use mpd && doins mpdstatus/mpdstatus.py
}
