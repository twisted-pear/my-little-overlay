# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

MULTILIB_COMPAT=( abi_x86_64 )

inherit desktop gnome2-utils multilib-build pax-utils unpacker xdg-utils

DESCRIPTION="A feature-rich client for Matrix.org"
HOMEPAGE="https://riot.im/"
SRC_URI="https://riot.im/packages/debian/pool/main/r/riot-web/riot-web_${PV}_amd64.deb"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="-* ~amd64"
IUSE="pax_kernel"

RDEPEND="app-accessibility/at-spi2-atk:2[${MULTILIB_USEDEP}]
	app-accessibility/at-spi2-core:2[${MULTILIB_USEDEP}]
	app-arch/bzip2:0/1[${MULTILIB_USEDEP}]
	dev-libs/atk:0[${MULTILIB_USEDEP}]
	dev-libs/expat:0[${MULTILIB_USEDEP}]
	dev-libs/fribidi:0[${MULTILIB_USEDEP}]
	dev-libs/glib:2[${MULTILIB_USEDEP}]
	dev-libs/gmp:0/10.4[${MULTILIB_USEDEP}]
	dev-libs/libbsd:0[${MULTILIB_USEDEP}]
	dev-libs/libffi:0[${MULTILIB_USEDEP}]
	dev-libs/libpcre:3[${MULTILIB_USEDEP}]
	dev-libs/libtasn1:0/6[${MULTILIB_USEDEP}]
	dev-libs/libunistring:0/2[${MULTILIB_USEDEP}]
	dev-libs/nettle:0/6.2[${MULTILIB_USEDEP}]
	dev-libs/nspr:0[${MULTILIB_USEDEP}]
	dev-libs/nss:0[${MULTILIB_USEDEP}]
	media-gfx/graphite2:0[${MULTILIB_USEDEP}]
	media-libs/alsa-lib:0[${MULTILIB_USEDEP}]
	media-libs/fontconfig:1.0[${MULTILIB_USEDEP}]
	media-libs/freetype:2[${MULTILIB_USEDEP}]
	media-libs/harfbuzz:0/0.9.18[${MULTILIB_USEDEP}]
	media-libs/libepoxy:0[${MULTILIB_USEDEP}]
	media-libs/libpng:0/16[${MULTILIB_USEDEP}]
	media-libs/mesa:0[${MULTILIB_USEDEP}]
	net-dns/libidn2:0[${MULTILIB_USEDEP}]
	net-libs/gnutls:0/30[${MULTILIB_USEDEP}]
	net-print/cups:0[${MULTILIB_USEDEP}]
	sys-apps/dbus:0[${MULTILIB_USEDEP}]
	sys-apps/util-linux:0[${MULTILIB_USEDEP}]
	sys-devel/gcc:7.3.0[${MULTILIB_USEDEP}]
	sys-libs/glibc:2.2[${MULTILIB_USEDEP}]
	sys-libs/libselinux:0[${MULTILIB_USEDEP}]
	sys-libs/zlib:0/1[${MULTILIB_USEDEP}]
	x11-libs/cairo:0[${MULTILIB_USEDEP}]
	x11-libs/gdk-pixbuf:2[${MULTILIB_USEDEP}]
	x11-libs/gtk+:3[${MULTILIB_USEDEP}]
	x11-libs/libdrm:0[${MULTILIB_USEDEP}]
	x11-libs/libX11:0[${MULTILIB_USEDEP}]
	x11-libs/libXau:0[${MULTILIB_USEDEP}]
	x11-libs/libxcb:0/1.12[${MULTILIB_USEDEP}]
	x11-libs/libXcomposite:0[${MULTILIB_USEDEP}]
	x11-libs/libXcursor:0[${MULTILIB_USEDEP}]
	x11-libs/libXdamage:0[${MULTILIB_USEDEP}]
	x11-libs/libXdmcp:0[${MULTILIB_USEDEP}]
	x11-libs/libXext:0[${MULTILIB_USEDEP}]
	x11-libs/libXfixes:0[${MULTILIB_USEDEP}]
	x11-libs/libXi:0[${MULTILIB_USEDEP}]
	x11-libs/libXinerama:0[${MULTILIB_USEDEP}]
	x11-libs/libXrandr:0[${MULTILIB_USEDEP}]
	x11-libs/libXrender:0[${MULTILIB_USEDEP}]
	x11-libs/libXScrnSaver:0[${MULTILIB_USEDEP}]
	x11-libs/libxshmfence:0[${MULTILIB_USEDEP}]
	x11-libs/libXtst:0[${MULTILIB_USEDEP}]
	x11-libs/libXxf86vm:0[${MULTILIB_USEDEP}]
	x11-libs/pango:0[${MULTILIB_USEDEP}]
	x11-libs/pixman:0[${MULTILIB_USEDEP}]"

QA_PREBUILT="opt/Riot/riot-web
	opt/Riot/libEGL.so
	opt/Riot/libffmpeg.so
	opt/Riot/libGLESv2.so
	opt/Riot/swiftshader/libEGL.so
	opt/Riot/swiftshader/libGLESv2.so
	opt/Riot/libVkICD_mock_icd.so"

S="${WORKDIR}"

src_prepare(){
	default
	unpack usr/share/doc/riot-web/changelog.gz
}

src_install() {
	dodoc changelog

	insinto /opt/Riot
	doins -r opt/Riot/.
	fperms +x /opt/Riot/riot-web
	use pax_kernel && pax-mark -m opt/Riot/riot-web

	insinto /usr/share
	doins -r usr/share/applications
	doins -r usr/share/icons

	dosym ../../opt/Riot/riot-web usr/bin/riot-web
}

pkg_postinst() {
	xdg_desktop_database_update
	gnome2_icon_cache_update
}

pkg_postrm() {
	xdg_desktop_database_update
	gnome2_icon_cache_update
}
