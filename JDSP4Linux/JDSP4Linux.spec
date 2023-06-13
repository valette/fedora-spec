# Tag: Effect
# Type: Pipewire
# Category: Effect

Name: jamesdsp
Version: 2.4
Release: 2%{?dist}
Summary: An audio effect processor for PipeWire clients
License: GPL-3.0-only
URL: https://github.com/theAeon/JDSP4Linux/

Vendor:       Audinux
Distribution: Audinux

# ./JDSP4Linux-source.sh <tag>
# ./JDSP4Linux-source.sh jamesdsp-2.4-2

Source0: JDSP4Linux.tar.gz
Source1: JDSP4Linux-source.sh

BuildRequires: gcc-c++
BuildRequires: make
BuildRequires: libarchive-devel
BuildRequires: (qt5-qtbase-devel >= 5.12.8 or libqt5-qtbase-devel >= 5.12.8)
BuildRequires: (qt5-qtbase-private-devel or libqt5-qtbase-private-headers-devel)
BuildRequires: (qt5-qtsvg-devel >= 5.12.8 or libqt5-qtsvg-devel >= 5.12.8)
BuildRequires: glibmm24-devel
BuildRequires: glib2-devel
BuildRequires: pipewire-devel

Requires: pipewire >= 0.3

%description
James DSP for Linux

%prep
%autosetup -n JDSP4Linux

%build

%set_build_flags

%ifarch aarch64
export CFLAGS="$CFLAGS -D__arm__"
export CXXFLAGS="$CXXFLAGS -D__arm__"
%endif
%if 0%{?fedora} >= 38
export CXXFLAGS="-include cstdint $CXXFLAGS"
%endif

%qmake_qt5 JDSP4Linux.pro
%make_build

%install

install -D -m 755 src/jamesdsp %{buildroot}/%{_bindir}/jamesdsp
install -D -m 644 resources/icons/icon.png %{buildroot}/%{_datadir}/pixmaps/jamesdsp.png
install -D -m 644 resources/icons/icon.svg %{buildroot}/%{_datadir}/hicolor/scalable/apps/jamesdsp.svg
install -D -m 755 meta/jamesdsp.desktop %{buildroot}/%{_datadir}/applications/jamesdsp.desktop

%files
%doc README.md
%license LICENSE
%{_bindir}/jamesdsp
%{_datadir}/pixmaps/jamesdsp.png
%{_datadir}/hicolor/scalable/apps/jamesdsp.svg
%{_datadir}/applications/jamesdsp.desktop

%changelog
* Mon Apr 17 2023 Yann Collette <ycollette.nospam@free.fr> - 2.4-2
- update to 2.4-2

* Mon OCt 24 2022 Yann Collette <ycollette.nospam@free.fr> - 2.3-2
- update to 2.3-2

* Fri Dec 31 2021 Andrew Robbins <andrew@robbinsa.me> - 2.3-1
- initial version of the spec
