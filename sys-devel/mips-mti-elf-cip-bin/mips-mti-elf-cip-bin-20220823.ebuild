# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit pax-utils

# TODO: Package for arm64
BIN_ARCH="amd64"

SRC_URI="https://repo.oss.cipunited.com/mips-toolchain-cip/${PV}/mips-mti-elf-${BIN_ARCH}.tar.xz"

DESCRIPTION="mips-mti-elf toolchain maintained by CIP United"
HOMEPAGE="https://oss.cipunited.com/"
LICENSE="GPL-3"
KEYWORDS="~amd64"

RESTRICT="preserve-libs strip"
QA_PREBUILT="*"
SLOT="0"

RDEPEND="
	dev-lang/perl
	sys-libs/zlib
"

S="${WORKDIR}/install-mips-mti-elf"

src_install() {
	local dest="/opt/${P}"

    dodir "${dest}"
	cp -pPR "${S}/." "${D}${dest}" || die

	cat <<-EOF > "${T}"/50${P}
        PATH="${dest}/bin"
		MANPATH="${dest}/share/man"
	EOF
	doenvd "${T}"/50${P}
}
