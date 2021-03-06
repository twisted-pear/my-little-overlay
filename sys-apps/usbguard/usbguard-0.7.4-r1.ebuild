# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit autotools

DESCRIPTION="The USBGuard software framework helps to protect your computer against BadUSB."
HOMEPAGE="https://github.com/dkopecek/usbguard"
SRC_URI="https://github.com/dkopecek/usbguard/releases/download/${P}/${P}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~x86 ~amd64"
SLOT="0"
IUSE="crypt +dbus qt4 qt5"
IUSE+=" +crypt_gcrypt crypt_sodium"

DEPEND="sys-cluster/libqb
		sys-libs/libseccomp
		sys-libs/libcap-ng
		>=dev-cpp/catch-1.5.6
		dev-libs/protobuf
		dev-libs/pegtl
		dbus? ( sys-apps/dbus
						dev-libs/dbus-glib )
		qt4? ( dev-qt/qtgui:4
						dev-qt/qtsvg:4
						dev-qt/qtcore:4 )
		qt5? ( dev-qt/qtgui:5
						dev-qt/qtsvg:5
						dev-qt/qtwidgets:5
						dev-qt/qtcore:5 )
		crypt? (
			crypt_gcrypt? ( dev-libs/libgcrypt )
			crypt_sodium? ( dev-libs/libsodium )
		)
		app-text/asciidoc
		"

RDEPEND="${DEPEND}
				virtual/udev"

REQUIRED_USE="
		crypt? (
			^^ (
					crypt_sodium
					crypt_gcrypt
			)
		)
		?? ( qt4 qt5 )"

src_prepare() {
	default
	# fix includes for Gentoo's catch
	sed -i 's#CPPFLAGS="-std=c++11 \$CPPFLAGS -I/usr/include/catch"$#CPPFLAGS="-std=c++11 $CPPFLAGS -I/usr/include/catch -I/usr/include/catch2"#' configure.ac
	sed -i 's#catch_CFLAGS="-I/usr/include/catch"$#catch_CFLAGS="-I/usr/include/catch -I/usr/include/catch2"#' configure.ac
	eautoreconf
}

src_configure() {
	local myconf=()

	if use crypt; then
		if use crypt_gcrypt; then
			myconf+=( --with-crypto-library=gcrypt )
		else
			myconf+=( --with-crypto-library=sodium )
		fi
	fi

	if use qt5; then
		myconf+=( --with-gui-qt=qt5 )
	elif use qt4; then
		myconf+=( --with-gui-qt=qt4 )
	fi

	econf \
		$(use_with dbus) \
		--without-polkit \
		"${myconf[@]}"
}

src_compile() {
	if use qt5; then
		export QT_SELECT=qt5
	elif use qt4; then
		export QT_SELECT=qt4
	fi

	emake
}

src_install() {
	emake DESTDIR="${D}" install

	doman doc/man/*.1
	doman doc/man/*.5
	doman doc/man/*.8

	insinto /etc/usbguard
	doins usbguard-daemon.conf

	newinitd ${FILESDIR}/runscript usbguard
}

pkg_postinst() {
	elog "You will need to allow access to your user for accessing the QT gui."
	elog "Execute as root. usbguard add-user YOUR_USERNAME --devices ALL --exceptions ALL"
}
