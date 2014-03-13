EAPI=4

DESCRIPTION="Password cracking for truecrypt volumes."
HOMEPAGE="https://code.google.com/p/truecrack/"
SRC_URI="https://truecrack.googlecode.com/files/${PN}_v35.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda"

DEPEND="cuda? ( x11-drivers/nvidia-drivers
                dev-util/nvidia-cuda-toolkit )"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

src_configure() {
	econf $(use cuda || echo "--enable-cpu")
}

src_install() {
	local dictdir=dictionary
	rm -r ${dictdir}/.svn

	dodir /usr/share/"${PN}"
	insinto /usr/share/"${PN}"
	doins -r ${dictdir}

	dodoc AUTHORS
	dodoc README

	doman truecrack.1

	dobin src/truecrack
}
