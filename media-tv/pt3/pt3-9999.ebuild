# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools git-r3 linux-mod

DESCRIPTION="denpa yun yun"
HOMEPAGE="https://github.com/m-tsudo/pt3"
SRC_URI=""
EGIT_REPO_URI="https://github.com/m-tsudo/pt3"
EGIT_BRANCH="master"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="x64"
IUSE=""

DEPEND="sys-fs/eudev virtual/pkgconfig"
RDEPEND="${DEPEND}"

MODULE_NAMES="pt3_drv(kernel/drivers/video:${S}:${S})"
BUILD_TARGETS="all"

src_compile() {
    BUILD_PARAMS="KBUILD=${KV_OUT_DIR}"
    linux-mod_src_compile
}

src_install() {
    local udevdir="$(pkg-config --variable=udevdir udev)"
    insinto "${udevdir}"/rules.d
    doins etc/99-pt3.rules
    linux-mod_src_install
}

