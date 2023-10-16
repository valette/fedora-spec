Name:    blocks
Version: 0.1
Release: 1%{?dist}
Summary: Simple modular synth
License: GPL-3.0-or-later
URL:     https://github.com/dan-german/blocks	

Vendor:       Audinux
Distribution: Audinux

# ./blocks-source.sh <project> <tag>
# ./blocks-source.sh blocks e59f62761a3efb05184d1150afed5e9a3b9351b4

Source0: blocks.tar.gz
Source1: blocks-source.sh

BuildRequires: gcc gcc-c++
BuildRequires: cmake
BuildRequires: cairo-devel
BuildRequires: fontconfig-devel
BuildRequires: freetype-devel
BuildRequires: gtk3-devel
BuildRequires: webkit2gtk3-devel
BuildRequires: libX11-devel
BuildRequires: xcb-util-keysyms-devel
BuildRequires: xcb-util-devel
BuildRequires: libXrandr-devel
BuildRequires: xcb-util-cursor-devel
BuildRequires: libxkbcommon-x11-devel
BuildRequires: libXinerama-devel
BuildRequires: mesa-libGL-devel
BuildRequires: libXcursor-devel
BuildRequires: libcurl-devel
BuildRequires: alsa-lib-devel
BuildRequires: jack-audio-connection-kit-devel

%description
Wavetable synth

%package -n vst3-%{name}
Summary: VST3 version of %{name}
License: BSD-3-Clause
Requires: %{name}%{?_isa} = %{version}-%{release}

%description -n vst3-%{name}
VST3 version of %{name}

%prep
%autosetup -n blocks

%build

%cmake
%cmake_build

%install 

install -m 755 -d %{buildroot}%{_libdir}/vst3/
install -m 755 -d %{buildroot}%{_bindir}/

install -m 755 -p %{__cmake_builddir}/blocks_artefacts/Standalone/* %{buildroot}/%{_bindir}/
cp -ra %{__cmake_builddir}/blocks_artefacts/VST3/* %{buildroot}/%{_libdir}/vst3/

%files
%doc README.md
%license LICENSE
%{_bindir}/*

%files -n vst3-%{name}
%{_libdir}/vst3/*

%changelog
* Mon Oct 16 2023 Yann Collette <ycollette.nospam@free.fr> - 0.1-1
- Initial spec file