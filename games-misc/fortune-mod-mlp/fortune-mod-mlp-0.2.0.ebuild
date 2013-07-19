EAPI=5

DESCRIPTION="Fortune cookies from My Little Pony: Friendship is Magic"
HOMEPAGE="https://github.com/twisted-pear/fortune-mod-mlp"
SRC_URI="https://github.com/twisted-pear/fortune-mod-mlp/tarball/${PV} -> ${P}.tar.gz"

SLOT="0"
KEYWORDS="~alpha amd64 ~arm hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc x86 ~x86-fbsd"
IUSE="offensive"

DEPEND="games-misc/fortune-mod"
RDEPEND="${DEPEND}"

RESTRICT="strip binchecks"

src_unpack() {
	unpack ${A}

	local dir=*-fortune-mod-mlp-*

	mv ${dir} ${P}
}

src_install() {
	insinto /usr/share/fortune
	doins mlp.dat mlp || die

	if use offensive ; then
		insinto /usr/share/fortune/off
		newins devquotes.dat mlp-devquotes.dat || die
		newins devquotes mlp-devquotes || die
	fi
}
