%global debug_package %{nil}

Name:    stochas
Version: 1.3.3
Release: 2%{?dist}
Summary: A VST3 MIDI sequencer
License: GPLv3

# Use ./source-stochas.sh to get the sources (latest master for now)
# ./source-stochas.sh v1.3.3

URL:     https://github.com/surge-synthesizer/stochas
Source0: stochas.tar.gz

BuildRequires: gcc gcc-c++
BuildRequires: cmake
BuildRequires: alsa-lib-devel
BuildRequires: gtk3-devel
BuildRequires: webkit2gtk3-devel
BuildRequires: libcurl-devel
BuildRequires: rsync
BuildRequires: fontconfig-devel
BuildRequires: freetype-devel
BuildRequires: jack-audio-connection-kit-devel

%description
A VST3 MIDI sequencer

%package -n vst3-%{name}
Summary:  VST3 version of %{name}
License:  GPLv2+
Requires: %{name}

%description -n vst3-%{name}
VST3 version of %{name}

%prep
%autosetup -n %{name}

sed -i -e "s/find_package/#find_package/g" cmake/versiontools.cmake

%build

%define _lto_cflags %{nil}

%cmake -DCMAKE_STRIP="true" 

%cmake_build

%install 

%__install -m 755 -d %{buildroot}%{_libdir}/vst3/
%if 0%{?fedora} < 33
%__install -m 644 -p stochas_artefacts/VST3/Stochas.vst3/Contents/x86_64-linux/*.so %{buildroot}/%{_libdir}/vst3/	
%else
%__install -m 644 -p %{_host}/stochas_artefacts/VST3/Stochas.vst3/Contents/x86_64-linux/*.so %{buildroot}/%{_libdir}/vst3/	
%endif

%__install -m 755 -d %{buildroot}%{_bindir}/
%if 0%{?fedora} < 33
%__install -m 644 -p stochas_artefacts/Standalone/Stochas %{buildroot}/%{_bindir}/
%else
%__install -m 644 -p %{_host}/stochas_artefacts/Standalone/Stochas %{buildroot}/%{_bindir}/
%endif

%files
%doc README.md
%license COPYING
%{_bindir}/*

%files -n vst3-%{name}
%{_libdir}/vst3/*

%changelog
* Sat Oct 3 2020 Yann Collette <ycollette.nospam@free.fr> - 1.3.3-2
- fix for fedora 33

* Sun Sep 6 2020 Yann Collette <ycollette.nospam@free.fr> - 1.3.3-1
- update to 1.3.3

* Thu Aug 13 2020 Yann Collette <ycollette.nospam@free.fr> - 0.0.1-1
- Initial spec file
