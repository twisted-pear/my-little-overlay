EAPI=4

DESCRIPTION="Theme collection for SLiM login manager inspired by My Little Pony"
HOMEPAGE="https://github.com/tablet-mode/slim-themes-mlp"
SRC_URI="https://github.com/tablet-mode/slim-themes-mlp/tarball/0.1.0 -> ${P}.tar.gz"

SLOT="0"
KEYWORDS="amd64 arm ppc ppc64 sparc x86 ~x86-fbsd"

RDEPEND="x11-misc/slim"

RESTRICT="strip binchecks"

S="${WORKDIR}"

src_install() {
	local dir=*-slim-themes-mlp-*
	rm ${dir}/.gitignore
	rm ${dir}/README.md

	local themesdir="/usr/share/slim/themes"
	insinto ${themesdir}
	doins -r ${dir}/*
}
