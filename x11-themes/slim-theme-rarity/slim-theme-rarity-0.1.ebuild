EAPI=4

DESCRIPTION="A Rarity theme for SLiM"
HOMEPAGE="https://github.com/tablet-mode/slim-theme-rarity"
# TODO: Make tablet-mode create a tag.
SRC_URI="https://github.com/tablet-mode/slim-theme-rarity/tarball/013e3b9e33f8a848c345cca1983a4a12839e8619 -> ${P}.tar.gz"

SLOT="0"
KEYWORDS="amd64 arm ppc ppc64 sparc x86 ~x86-fbsd"

RDEPEND="x11-misc/slim"

RESTRICT="strip binchecks"

S="${WORKDIR}"

src_install() {
	local dir=*-slim-theme-rarity-*
	rm ${dir}/.gitignore
	rm ${dir}/README.md

	local themesdir="/usr/share/slim/themes"
	insinto ${themesdir}/rarity
	doins ${dir}/*
}
