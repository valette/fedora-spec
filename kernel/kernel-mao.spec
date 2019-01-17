# Kernel major version
%define kmaj  4
# Kernel minor version
%define kmin  19
# Kernel patch version
%define kpat  15
# package version
%define krel  7
# RT patch version
%define krt   12

%define kver  %{kmaj}.%{kmin}.%{kpat}
%define fcver %{dist}.%{_arch}

Name:    kernel-rt-mao
Summary: The Linux Real Time Kernel
Version: %{kver}.rt%{krt}
Release: %{krel}%{?dist}
License: GPL
Group:   System Environment/Kernel
Vendor:  The Linux Community
URL:     http://www.kernel.org

Source0: https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-%{kver}.tar.gz
Source1: kernel-config-%{kmaj}.%{kmin}

Patch0: https://mirrors.edge.kernel.org/pub/linux/kernel/projects/rt/%{kmaj}.%{kmin}/older/patch-%{kver}-rt%{krt}.patch.gz

BuildRequires: openssl-devel, openssl
BuildRequires: kmod, patch, bash, tar
BuildRequires: bzip2, xz, findutils, gzip, m4, perl-interpreter, perl-Carp, perl-devel, perl-generators, make, diffutils, gawk
BuildRequires: gcc, binutils, redhat-rpm-config, bison, flex
BuildRequires: net-tools, hostname, bc, elfutils-devel
BuildRequires: rpm-build, rpm, elfutils, elfutils-libelf-devel
BuildRequires: grub2-tools
BuildRequires: sed

BuildRoot: %{_tmppath}/%{name}-%{PACKAGE_VERSION}-root

Provides: kernel = %{version}
Provides: kernel-rt-mao = %{version}

%define __spec_install_post /usr/lib/rpm/brp-compress || :
%define debug_package %{nil}

%description
The Linux Real Time Kernel, the operating system core itself

%package headers
Summary: Header files for the Linux real time kernel for use by glibc
Group: Development/System

%description headers
Kernel-headers includes the C header files that specify the interface
between the Linux kernel and userspace libraries and programs.  The
header files define structures and constants that are needed for
building most standard programs and are also needed for rebuilding the
glibc package.

%package devel
Summary: Development package for building real time kernel modules to match the %{version} kernel
Group: System Environment/Kernel
AutoReqProv: no

%description devel
This package provides real time kernel headers and makefiles sufficient to build modules
against the %{version} kernel package.

%prep
%setup -q -n linux-%{kver}

%patch0 -p1

cp %{SOURCE1} .config
sed -i -e "s/EXTRAVERSION =/EXTRAVERSION = -rt%{krt}%{fcver}/g" Makefile
echo "" > localversion-rt

make oldconfig

%build

make clean && make %{?_smp_mflags}

%install
KBUILD_IMAGE=$(make image_name)

%ifarch ia64
  mkdir -p $RPM_BUILD_ROOT/boot/efi $RPM_BUILD_ROOT/lib/modules
%else
  mkdir -p $RPM_BUILD_ROOT/boot     $RPM_BUILD_ROOT/lib/modules
%endif

INSTALL_MOD_PATH=$RPM_BUILD_ROOT make %{?_smp_mflags} KBUILD_SRC= mod-fw= INSTALL_MOD_STRIP=1 CONFIG_MODULE_COMPRESS=1 CONFIG_MODULE_COMPRESS_XZ=1 modules_install

# We estimate the size of the initramfs because rpm needs to take this size
# into consideration when performing disk space calculations. (See bz #530778)
dd if=/dev/zero of=$RPM_BUILD_ROOT/boot/initramfs-$KernelVer%{fcver}.img bs=1M count=20

%ifarch ia64
  cp $KBUILD_IMAGE $RPM_BUILD_ROOT/boot/efi/vmlinuz-%{kver}-rt%{krt}%{fcver}
  ln -s efi/vmlinuz-%{kver}-%{krt}%{fcver} $RPM_BUILD_ROOT/boot/
%else
  cp $KBUILD_IMAGE $RPM_BUILD_ROOT/boot/vmlinuz-%{kver}-rt%{krt}%{fcver}
%endif

make %{?_smp_mflags} INSTALL_HDR_PATH=$RPM_BUILD_ROOT/usr KBUILD_SRC= headers_install
cp System.map $RPM_BUILD_ROOT/boot/System.map-%{kver}-rt%{krt}%{fcver}
cp .config    $RPM_BUILD_ROOT/boot/config-%{kver}-rt%{krt}%{fcver}

rm -f    $RPM_BUILD_ROOT/lib/modules/%{kver}-rt%{krt}/{build,source}
mkdir -p $RPM_BUILD_ROOT/usr/src/kernels/%{kver}-rt%{krt}%{fcver}
EXCLUDES="--exclude SCCS --exclude BitKeeper --exclude .svn --exclude CVS --exclude .pc --exclude .hg --exclude .git --exclude .tmp_versions --exclude=*vmlinux* --exclude=*.o --exclude=*.ko --exclude=*.ko.xz --exclude=*.cmd --exclude=Documentation --exclude=firmware --exclude .config.old --exclude .missing-syscalls.d"
tar $EXCLUDES -cf- . | (cd $RPM_BUILD_ROOT/usr/src/kernels/%{kver}-rt%{krt}%{fcver}; tar xvf -)

%clean
rm -rf $RPM_BUILD_ROOT

%post
# Create the vmlinuz file
/bin/kernel-install add %{kver}-rt%{krt}%{fcver} /lib/modules/%{kver}-rt%{krt}%{fcver}
grub2-mkconfig -o /boot/grub2/grub.cfg

%postun
grub2-mkconfig -o /boot/grub2/grub.cfg
#test -e /boot/initramfs-%{kver}-rt%{krt}.img && rm -f /boot/initramfs-%{kver}-rt%{krt}.img

%files
%defattr (-, root, root)
/lib/modules/%{kver}-rt%{krt}%{fcver}
/boot/*
%ghost /boot/initramfs-%{kver}-rt%{krt}%{fcver}

%files headers
%defattr (-, root, root)
/usr/include

%files devel
%defattr (-, root, root)
/usr/src/kernels/%{kver}-rt%{krt}%{fcver}

%changelog
* Tue Jan 15 2019 Yann Collette <ycollette.nospam@free.fr> - 4.19.15-rt12-7
- update to 4.19.15-rt12-7

* Tue Jan 15 2019 Yann Collette <ycollette.nospam@free.fr> - 4.19.13-rt10-7
- update to 4.19.13-rt10-7 - fix package version

* Thu Jan 10 2019 Yann Collette <ycollette.nospam@free.fr> - 4.19.13-rt10-6
- update to 4.19.13-rt10-6

* Wed Jan 9 2019 Yann Collette <ycollette.nospam@free.fr> - 4.19.13-rt10-5
- update to 4.19.13-rt10-5

* Sun Oct 28 2018 Yann Collette <ycollette.nospam@free.fr> - 4.18.16-rt8-5
- fix kernel install

* Sat Oct 27 2018 Yann Collette <ycollette.nospam@free.fr> - 4.18.16-rt8-4
- add 4.18.16-rt8 kernel

* Wed Oct 10 2018 Yann Collette <ycollette.nospam@free.fr> - 4.18.12-rt7-3
- add 4.18.12-rt7 kernel

* Tue Sep 18 2018 Yann Collette <ycollette.nospam@free.fr> - 4.18.7-rt5-3
- add 4.18.7-rt5 kernel

* Sat Sep 8 2018 Yann Collette <ycollette.nospam@free.fr> - 4.16.18-rt11-3
- add 4.16.18-rt11 kernel

* Sun Jul 22 2018 Yann Collette <ycollette.nospam@free.fr> - 4.16.18-rt10-3
- add 4.16.18-rt10 kernel

* Sat Jun 23 2018 Yann Collette <ycollette.nospam@free.fr> - 4.16.15-rt7-3
- add 4.16.15-rt7 kernel

* Wed Jun 13 2018 Yann Collette <ycollette.nospam@free.fr> - 4.16.12-rt5-3
- fix a huge config problem

* Sun Jun 10 2018 Yann Collette <ycollette.nospam@free.fr> - 4.14.40-2
- add 4.14.40-rt30 kernel (4.16 kernels are xrunning)

* Sun Jun 10 2018 Yann Collette <ycollette.nospam@free.fr> - 4.16.12-rt5-2
- add 4.16.12-rt5 kernel

* Sun Jun 10 2018 Yann Collette <ycollette.nospam@free.fr> - 4.16.8-rt2-2
- add 4.16.8-rt2 kernel
