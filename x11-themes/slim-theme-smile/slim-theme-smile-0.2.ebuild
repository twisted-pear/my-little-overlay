EAPI=4

DESCRIPTION="A Pinkie Pie theme for SLiM"
HOMEPAGE="https://github.com/tablet-mode/slim_theme_smile"
SRC_URI="https://github.com/tablet-mode/slim_theme_smile/tarball/0.2 -> ${P}.tar.gz"

SLOT="0"
KEYWORDS="amd64 arm ppc ppc64 sparc x86 ~x86-fbsd"

RDEPEND="x11-misc/slim"

RESTRICT="strip binchecks"

S="${WORKDIR}"

src_install() {
	local dir=*-slim-theme-smile-*
	rm ${dir}/.gitignore
	rm ${dir}/README.md

	local themesdir="/usr/share/slim/themes"
	insinto ${themesdir}/smile
	doins ${dir}/*
}
