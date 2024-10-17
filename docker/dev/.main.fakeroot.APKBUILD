# Maintainer: Natanael Copa <ncopa@alpinelinux.org>
pkgname=fakeroot
pkgver=1.34
pkgrel=0
provider_priority=100
pkgdesc="Gives a fake root environment, useful for building packages as a non-privileged user"
arch="all"
license="GPL-3.0-or-later"
url="https://packages.debian.org/fakeroot"
checkdepends="bash coreutils"
makedepends_build="libtool autoconf automake po4a"
makedepends_host="libcap-dev acl-dev linux-headers"
makedepends="$makedepends_build $makedepends_host"
subpackages="$pkgname-dbg $pkgname-doc"
source="https://blueprints.launchpad.net/ubuntu/+archive/primary/+sourcefiles/fakeroot/$pkgver-1/fakeroot_$pkgver.orig.tar.gz
	fakeroot-no64.patch
	fakeroot-stdint.patch
	xstatjunk.patch
	fix-shell-in-fakeroot.patch
	fakeroot-skip-ipc-sanity-check.patch
	do-not-redefine-id_t.patch
	fix-format.patch
	t-xattr.patch
	"

prepare() {
	default_prepare

	CONFIG_SHELL=/bin/sh ./bootstrap
}

build() {
	# musl does not have _STAT_VER, it's really not used for
	# anything, so define it as zero (just like uclibc does)
	export CFLAGS="-D_STAT_VER=0 $CFLAGS"

	CONFIG_SHELL=/bin/sh ./configure \
		--build=$CBUILD \
		--host=$CHOST \
		--prefix=/usr \
		--disable-static

	make
	cd doc
	po4a -k 0 --rm-backups --variable "srcdir=../doc/" po4a/po4a.cfg
}

check() {
	make check || {
		cat test/test-suite.log
		return 1
	}
}

package() {
	make DESTDIR="$pkgdir" install
}

sha512sums="
d3b4b9ca8718ba945029e151415a24412ca5a40dbefe6fbfaed3565879b5ad80b4b6de9748695a8848c3086e3ba1cde270efc8dfb4cc345cf8aa11f3234153f1  fakeroot_1.34.orig.tar.gz
7a832e6bed3838c7c488e0e12ba84b8d256e84bbb06d6020247452a991de505fa5c6bd7bcb84dce8753eb242e0fcab863b5461301cd56695f2b003fe8d6ff209  fakeroot-no64.patch
ed7a58b0d201139545420f9e5429f503c00e00f36dea84473e77ea99b23bb8d421da1a8a8ce98ff90e72e378dff4cb9ea3c1a863a969899a5f50dfac3b9c5fac  fakeroot-stdint.patch
70bf7609a5951326ac7372a252a15516f96a1ee6e458a659b16f0e4f1e2db6556482c71178d4b2f10e5ebdc0abfb7a3cc97c9878984e60cdf6e7d7281790e1fc  xstatjunk.patch
47593b3d86a66bab832c50a1d967cdc70e42bbd9ef4436f18140067ccefdd6418516e5157102c67e604f3623ed1b9f4fe1423fc5dad4dfe5356fc250c12818a7  fix-shell-in-fakeroot.patch
9a3faf924891deb36fab8f200489ad6154df262735b563dea46283afcdc83d12d32b00db33848f2a5c52d0b4422942863247577634e37b9d693f2b3a398a0f1d  fakeroot-skip-ipc-sanity-check.patch
e07162ec511c38261ad2540864f922ee03f5daa1d5d23729879c9993d62b2ffebc27eab29f3eb522ddb10b052241e58b67265914ef9100b1911948e874bf53a1  do-not-redefine-id_t.patch
481fac0b2b7388fbf8c6140311da856df1b8facfe331d04f2bc6275c766b8a81c1e07971ffd131aaf8416b8cda1f52fa4ed6d5f6ba913f69efe119288c016d78  fix-format.patch
70d09c2acb3abccddbb99cd1cb372679d4da6c01d3bab6a1dcf258b1decc88834ae7a5f61f15867ead035819e250f8b40fddcc83eb9ce82138fa18c756836b21  t-xattr.patch
"
