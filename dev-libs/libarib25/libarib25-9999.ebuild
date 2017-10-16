# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils git-r3

DESCRIPTION="libarib25"
HOMEPAGE="https://github.com/stz2012/libarib25"
SRC_URI=""
EGIT_REPO_URI="https://github.com/stz2012/libarib25"
EGIT_BRANCH="master"

SLOT="0"
IUSE=""

src_prepare() {
	grep -v "LDCONFIG_EXECUTABLE" CMakeLists.txt | sed -e "s/\(TARGETS .*lib\) \(.*lib\)/\1\${LIB_SUFFIX} \2\${LIB_SUFFIX}/g" > CMakeLists.temp
	mv CMakeLists.temp CMakeLists.txt
	cat CMakeLists.txt
	cmake-utils_src_prepare
}

