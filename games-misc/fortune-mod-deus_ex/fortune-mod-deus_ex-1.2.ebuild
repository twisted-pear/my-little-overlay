EAPI=5

DESCRIPTION="Fortune cookies from Deus Ex (aka the best game ever)"
HOMEPAGE="http://cdkr.co.uk/misc/deus_ex"
SRC_URI="http://cdkr.co.uk/software/Deus.Ex.Fortune.v1.2.tar.bz2 -> ${P}.tar.bz2"

SLOT="0"
KEYWORDS="~alpha amd64 ~arm hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc x86 ~x86-fbsd"

RDEPEND="games-misc/fortune-mod"

RESTRICT="strip binchecks"

src_unpack() {
	unpack ${A}

	local dir=dx_fortune.*

	mv ${dir} ${P}
}

src_install() {
	insinto /usr/share/fortune
	doins deus_ex.dat deus_ex || die
}
