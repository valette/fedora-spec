# Tag: Synthesizer
# Type: Plugin, VST3, CLAP
# Category: Audio, Synthesizer

Name: firefly-synth
Version: 1.4.0
Release: 1%{?dist}
Summary: Semi-modular synthesizer plugin
License: GPL-3.0-or-later
URL: https://github.com/sjoerdvankreel/firefly-synth

Vendor:       Audinux
Distribution: Audinux

# Usage: ./synth-source.sh <PROJECT> <TAG>
#        ./synth-source.sh firefly-synth v1.4.0

Source0: firefly-synth.tar.gz
Source1: synth-source.sh

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
A semi-modular software synthesizer plugin. It's basically InfernalSynth's big brother.

%package -n vst3-%{name}
Summary:  VST3 version of %{name}
License:  GPL-3.0-or-later
Requires: %{name}

%description -n vst3-%{name}
VST3 version of %{name}

%package -n clap-%{name}
Summary:  CLAP version of %{name}
License:  GPL-3.0-or-later
Requires: %{name}

%description -n clap-%{name}
CLAP version of %{name}

%prep
%autosetup -n %{name}

%build

%cmake -DCMAKE_BUILD_TYPE=RELEASE
%cmake_build

%install

install -m 755 -d %{buildroot}/%{_libdir}/vst3/
cp -rav dist/RELEASE/linux/*.vst3 %{buildroot}/%{_libdir}/vst3/

install -m 755 -d %{buildroot}/%{_libdir}/clap/
cp -rav dist/RELEASE/linux/*.clap %{buildroot}/%{_libdir}/clap/

%files
%doc README.md
%license LICENSE

%files -n vst3-%{name}
%{_libdir}/vst3/*

%files -n clap-%{name}
%{_libdir}/clap/*

%changelog
* Tue Mar 19 2024 Yann Collette <ycollette.nospam@free.fr> - 1.4.0-1
- update to 1.4.0-1

* Sat Mar 16 2024 Yann Collette <ycollette.nospam@free.fr> - 1.3.1-1
- update to 1.3.1-1

* Mon Mar 11 2024 Yann Collette <ycollette.nospam@free.fr> - 1.3.0-1
- update to 1.3.0-1

* Mon Mar 11 2024 Yann Collette <ycollette.nospam@free.fr> - 1.2.4-1
- update to 1.2.4-1

* Sun Mar 10 2024 Yann Collette <ycollette.nospam@free.fr> - 1.2.3-1
- update to 1.2.3-1

* Sun Mar 10 2024 Yann Collette <ycollette.nospam@free.fr> - 1.2.2-1
- update to 1.2.2-1

* Sat Mar 09 2024 Yann Collette <ycollette.nospam@free.fr> - 1.2.1-1
- update to 1.2.1-1

* Wed Mar 06 2024 Yann Collette <ycollette.nospam@free.fr> - 1.2.0-1
- update to 1.2.0-1

* Mon Feb 26 2024 Yann Collette <ycollette.nospam@free.fr> - 1.11-1
- update to 1.11-1

* Sun Feb 25 2024 Yann Collette <ycollette.nospam@free.fr> - 1.1-1
- update to 1.1-1

* Tue Feb 20 2024 Yann Collette <ycollette.nospam@free.fr> - 1.09-1
- update to 1.09-1

* Wed Feb 14 2024 Yann Collette <ycollette.nospam@free.fr> - 1.08-1
- update to 1.08-1

* Tue Feb 13 2024 Yann Collette <ycollette.nospam@free.fr> - 1.07-1
- update to 1.07-1

* Mon Feb 12 2024 Yann Collette <ycollette.nospam@free.fr> - 1.06-1
- update to 1.06-1

* Sat Feb 10 2024 Yann Collette <ycollette.nospam@free.fr> - 1.05-1
- update to 1.05-1

* Fri Feb 09 2024 Yann Collette <ycollette.nospam@free.fr> - 1.04-1
- update to 1.04-1

* Sat Feb 03 2024 Yann Collette <ycollette.nospam@free.fr> - 1.03-1
- update to 1.03-1

* Sat Feb 03 2024 Yann Collette <ycollette.nospam@free.fr> - 1.02-1
- update to 1.02-1

* Thu Feb 01 2024 Yann Collette <ycollette.nospam@free.fr> - 1.01-1
- update to 1.01-1

* Sun Jan 28 2024 Yann Collette <ycollette.nospam@free.fr> - 1.0-1
- update to 1.0-1

* Sat Jan 27 2024 Yann Collette <ycollette.nospam@free.fr> - 0.1-1
- Initial spec file
