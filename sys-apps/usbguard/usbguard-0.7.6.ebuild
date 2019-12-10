# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit autotools

DESCRIPTION="The USBGuard software framework helps to protect your computer against BadUSB."
HOMEPAGE="https://github.com/USBGuard/usbguard"
SRC_URI="https://github.com/USBGuard/usbguard/releases/download/${P}/${P}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~x86 ~amd64"
SLOT="0"
IUSE="crypt +dbus"
IUSE+=" +crypt_gcrypt crypt_sodium"

DEPEND="sys-cluster/libqb
		sys-libs/libseccomp
		sys-libs/libcap-ng
		>=dev-cpp/catch-1.5.6
		dev-libs/protobuf
		dev-libs/pegtl
		dbus? ( sys-apps/dbus
						dev-libs/dbus-glib )
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
		)"

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

	econf \
		$(use_with dbus) \
		--without-polkit \
		"${myconf[@]}"
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
