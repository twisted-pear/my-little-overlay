EAPI=5

DESCRIPTION="Theme collection for SLiM login manager inspired by My Little Pony"
HOMEPAGE="https://github.com/tablet-mode/slim-themes-mlp"
SRC_URI="https://github.com/tablet-mode/slim-themes-mlp/archive/${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
KEYWORDS="amd64 arm ppc ppc64 sparc x86 ~x86-fbsd"
IUSE="source offensive"

RDEPEND="x11-misc/slim"

RESTRICT="strip binchecks"

src_install() {
	rm .gitignore
	rm README.md

	if ! use offensive; then
		rm -rf brad
	fi

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
