EAPI=5

DESCRIPTION="Theme collection for SLiM login manager inspired by My Little Pony"
HOMEPAGE="https://github.com/tablet-mode/slim-themes-mlp"
SRC_URI="https://github.com/tablet-mode/slim-themes-mlp/tarball/${PV} -> ${P}.tar.gz"

SLOT="0"
KEYWORDS="amd64 arm ppc ppc64 sparc x86 ~x86-fbsd"
IUSE="source"

RDEPEND="x11-misc/slim"

RESTRICT="strip binchecks"

S="${WORKDIR}"

src_install() {
	local dir=*-slim-themes-mlp-*
	cd ${dir}

	rm .gitignore
	rm README.md

	local themesdir="/usr/share/slim/themes"
	local srcdir="/usr/src/${PN}"

	for theme in *; do
		insinto ${themesdir}/${theme}
		doins ${theme}/panel.*
		doins ${theme}/background.*
		doins ${theme}/slim.theme

		if use source; then
			insinto ${srcdir}/${theme}
			doins ${theme}/src/*
		fi
	done
}
