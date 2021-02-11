Summary: BambooTracker is a music tracker for the Yamaha YM2608 sound chip
Name:    BambooTracker
Version: 0.4.6
Release: 1%{?dist}
License: GPL
URL:     https://github.com/rerrahkr/BambooTracker

# To get the sources: ./bambootracker_source.sh v0.4.6
Source0: BambooTracker.tar.gz
Source1: bambootracker_source.sh

BuildRequires: gcc gcc-c++
BuildRequires: make
BuildRequires: alsa-lib-devel
BuildRequires: pulseaudio-libs-devel
BuildRequires: jack-audio-connection-kit-devel
BuildRequires: desktop-file-utils
BuildRequires: qt5-qtmultimedia-devel
BuildRequires: qt5-qtbase-devel
BuildRequires: qt5-qtbase-gui
BuildRequires: qt5-linguist
BuildRequires: qtchooser

%description
BambooTracker is a music tracker for the Yamaha YM2608 (OPNA) sound chip which was used in NEC PC-8801/9801 series computers.

%prep
%autosetup -n %{name}

%build

%qmake_qt5 "PREFIX=/usr" CONFIG+=release CONFIG+=use_alsa CONFIG+=use_pulse CONFIG+=use_jack Project.pro
%make_build PREFIX=/usr CXXFLAGS="-fPIC" sub-submodules-RtAudio-RtAudio-pro
%make_build PREFIX=/usr CXXFLAGS="-fPIC" sub-submodules-RtMidi-RtMidi-pro
%make_build PREFIX=/usr CXXFLAGS="-fPIC" sub-BambooTracker
%make_build PREFIX=/usr CXXFLAGS="-fPIC" sub-data

%install

%make_install INSTALL_ROOT=%{buildroot} PREFIX=/usr

desktop-file-install --vendor '' \
        --add-category=Midi \
        --add-category=Sequencer \
        --dir %{buildroot}%{_datadir}/applications \
        %{buildroot}%{_datadir}/applications/%{name}.desktop

%files
%doc CHANGELOG.md IMPORTANT.md LICENSE README.md README_ja.md
%license LICENSE
%{_bindir}/*
%{_datadir}/*

%changelog
* Thu Feb 11 2021 Yann Collette <ycollette.nospam@free.fr> - 0.4.6-1
- update to version 0.4.6-1

* Fri Nov 06 2020 Yann Collette <ycollette.nospam@free.fr> - 0.4.5-1
- update to version 0.4.5-1

* Sun Aug 23 2020 Yann Collette <ycollette.nospam@free.fr> - 0.4.4-1
- update to version 0.4.4-1

* Sun Jun 28 2020 Yann Collette <ycollette.nospam@free.fr> - 0.4.3-1
- update to version 0.4.3-1

* Sun May 10 2020 Yann Collette <ycollette.nospam@free.fr> - 0.4.2-1
- update to version 0.4.2-1

* Sat Apr 25 2020 Yann Collette <ycollette.nospam@free.fr> - 0.4.1-1
- update to version 0.4.1-1

* Thu Apr 2 2020 Yann Collette <ycollette.nospam@free.fr> - 0.4.0-1
- update to version 0.4.0-1

* Sun Feb 23 2020 Yann Collette <ycollette.nospam@free.fr> - 0.3.5-1
- update to version 0.3.5-1

* Wed Jan 29 2020 Yann Collette <ycollette dot nospam at free.fr> 0.3.4-1
- Update to version 0.3.4

* Wed Dec 18 2019 Yann Collette <ycollette dot nospam at free.fr> 0.3.3-1
- Update to version 0.3.3

* Sun Dec 15 2019 Yann Collette <ycollette dot nospam at free.fr> 0.3.2-1
- Update to version 0.3.2

* Sat Nov 30 2019 Yann Collette <ycollette dot nospam at free.fr> 0.3.1-1
- Update to version 0.3.1

* Fri Nov 1 2019 Yann Collette <ycollette dot nospam at free.fr> 0.3.0-1
- Update to version 0.3.0

* Tue Sep 17 2019 Yann Collette <ycollette dot nospam at free.fr> 0.2.4-1
- Update to version 0.2.4

* Sun Sep 1 2019 Yann Collette <ycollette dot nospam at free.fr> 0.2.3-1
- Update to version 0.2.3

* Thu Jun 27 2019 Yann Collette <ycollette dot nospam at free.fr> 0.2.2-1
- Update to version 0.2.2

* Mon Jun 17 2019 Yann Collette <ycollette dot nospam at free.fr> 0.2.1-1
- Update to version 0.2.1

* Thu May 30 2019 Yann Collette <ycollette dot nospam at free.fr> 0.2.0-1
- Initial release of spec file
