# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3
EGIT_REPO_URI="https://github.com/mjg59/tpmtotp.git"
DESCRIPTION="Attest computer boot state to phone via TOTP"
HOMEPAGE="https://github.com/mjg59/tpmtotp/"

LICENSE="GPL-2"
SLOT="0"
IUSE="static libressl"
KEYWORDS="~amd64"

PATCHES=( "${FILESDIR}"/tpmtotp-makefile-fix.patch )

DEPEND="
	app-crypt/trousers
	libressl? ( dev-libs/libressl )
	!libressl? ( dev-libs/openssl )
	media-gfx/qrencode
	sys-auth/oath-toolkit
	sys-libs/zlib
	static? (
		dev-libs/openssl[static-libs]
		sys-libs/zlib[static-libs]
	)
"
RDEPEND="${DEPEND}"

src_unpack() {
	git-r3_src_unpack
	default
}

src_configure() {
	use static && export LDFLAGS="${LDFLAGS} -static"
}

src_install() {
	dobin sealtotp unsealtotp
}
