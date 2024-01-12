# Tag: Synthesizer
# Type: Plugin, VST3
# Category: Audio, Synthesizer

Name: infernal-synth
Version: 1.4p1
Release: 1%{?dist}
Summary: An open source VST3 synthesizer and effect plugin.
License: GPL-3.0-or-later
URL: https://sjoerdvankreel.github.io/infernal-synth/

Vendor:       Audinux
Distribution: Audinux

#Source0: https://github.com/sjoerdvankreel/infernal-synth/archive/refs/tags/v%{version}.tar.gz#/%{name}-%{version}.tar.gz
Source0: https://github.com/sjoerdvankreel/infernal-synth/archive/refs/tags/v1.4-preview1.tar.gz#/%{name}-%{version}.tar.gz

BuildRequires: gcc gcc-c++
BuildRequires: cmake
BuildRequires: alsa-lib-devel
BuildRequires: cairo-devel
BuildRequires: fontconfig-devel
BuildRequires: libX11-devel
BuildRequires: libXrandr-devel
BuildRequires: freetype-devel
BuildRequires: libcurl-devel
BuildRequires: libxkbcommon-x11-devel
BuildRequires: xcb-util-cursor-devel
BuildRequires: xcb-util-keysyms-devel
BuildRequires: xcb-util-devel
BuildRequires: webkit2gtk3-devel
BuildRequires: gtk3-devel

%description
InfernalSynth is a semi-modular software synthesizer and effect plugin.
For system requirements, download and installation, see the project website.

%package -n vst3-%{name}
Summary:  VST3 version of %{name}
License:  GPL-3.0-or-later
Requires: %{name}

%description -n vst3-%{name}
VST3 version of %{name}

%prep
# autosetup -n %{name}-%{version}-preview1
%autosetup -n %{name}-1.4-preview1

sed -i -e "/-Werror/d" CMakeLists.txt
sed -i -e "/-march=native/d" CMakeLists.txt

%build

%cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_CXX_FLAGS="-include tuple -include atomic -fPIC $CXXFLAGS"
%cmake_build

%install

install -m 755 -d %{buildroot}/%{_libdir}/vst3/
cp -rav dist/linux_/RELEASE/* %{buildroot}/%{_libdir}/vst3/

%files
%doc README.md MANUAL.md
%license LICENSE

%files -n vst3-%{name}
%{_libdir}/vst3/*

%changelog
* Sun Aug 27 2023 Yann Collette <ycollette.nospam@free.fr> - 1.4p1-1
- update to 1.4-preview-1

* Sun Jul 30 2023 Yann Collette <ycollette.nospam@free.fr> - 1.2-1
- update to 1.2-1

* Tue Jul 25 2023 Yann Collette <ycollette.nospam@free.fr> - 1.2p6-1
- update to 1.2p6-1

* Mon Jul 24 2023 Yann Collette <ycollette.nospam@free.fr> - 1.2p5-1
- update to 1.2p5-1

* Sun Jul 23 2023 Yann Collette <ycollette.nospam@free.fr> - 1.2p4-1
- Initial spec file
