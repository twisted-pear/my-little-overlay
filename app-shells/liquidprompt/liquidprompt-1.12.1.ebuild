EAPI=5

DESCRIPTION="A full-featured & carefully designed adaptive prompt for Bash & Zsh"
HOMEPAGE="https://github.com/nojhan/liquidprompt"
SRC_URI="https://github.com/nojhan/liquidprompt/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="examples"

RDEPEND=""
DEPEND=""

RESTRICT="strip binchecks"

src_install() {
	dolib liquidprompt

	insinto /etc
	newins liquidpromptrc-dist liquidpromptrc

	dodoc README.md

	if use examples; then
		insinto /usr/share/doc/${PF}/examples
		doins example.bashrc liquid.ps1 liquid.theme
	fi
}
