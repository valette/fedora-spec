# Tag: Modular, Rack
# Type: Rack
# Category: Audio, Synthesizer

%define use_static_glfw 0
%define use_static_rtaudio 1

Name:    Rack-v2
Version: 2.1.0
Release: 1%{?dist}
Summary: A modular Synthesizer
License: GPLv2+
URL:     https://github.com/VCVRack/Rack

Vendor:       Audinux
Distribution: Audinux

# ./rack-source-v2.sh <tag>
# ./rack-source-v2.sh v2.1.0

Source0: Rack.tar.gz
Source1: Rack-manual.tar.gz
Source2: rack-source-v2.sh
Patch0:  rack-v2-0001-initialize-system-path.patch

BuildRequires: gcc gcc-c++
BuildRequires: cmake sed
BuildRequires: alsa-lib-devel
BuildRequires: jack-audio-connection-kit-devel
BuildRequires: libsamplerate-devel
BuildRequires: libzip-devel
BuildRequires: glew-devel
%if !%{use_static_glfw}
BuildRequires: glfw-devel
%endif
%if !%{use_static_rtaudio}
BuildRequires: rtaudio-devel
%endif
BuildRequires: portmidi-devel
BuildRequires: portaudio-devel
BuildRequires: pulseaudio-libs-devel
BuildRequires: libcurl-devel
BuildRequires: openssl-devel
BuildRequires: jansson-devel
BuildRequires: gtk3-devel
BuildRequires: rtmidi-devel
%if !%{use_static_rtaudio}
BuildRequires: rtaudio-devel
%endif
BuildRequires: speex-devel
BuildRequires: speexdsp-devel
BuildRequires: gulrak-filesystem-devel
BuildRequires: libarchive-devel
BuildRequires: libzstd-devel
BuildRequires: libsndfile-devel
BuildRequires: python3-sphinx
BuildRequires: python3-recommonmark
BuildRequires: python3-sphinx_rtd_theme

%description
A modular Synthesizer

%package doc
Summary: Documentation files for Rack
BuildArch: noarch

%description doc
Documentation files for Rack

%prep
%autosetup -p1 -n Rack

CURRENT_PATH=`pwd`

# Remove some architectures optimization
sed -i -e "s/-march=nehalem//g" compile.mk
sed -i -e "s/-march=nehalem//g" dep.mk
# For -O2 usage
sed -i -e "s/-O3/-O2/g" compile.mk
sed -i -e "s/-O3/-O2/g" dep.mk
sed -i -e "s/DEP_FLAGS += -g -O2/DEP_FLAGS += -g -O2 \$(CFLAGS)/g" dep.mk 

# Remove static gcc lib
sed -i -e "s/-static-libstdc++ -static-libgcc//g" Makefile
sed -i -e "s/-static-libstdc++ -static-libgcc//g" plugin.mk

%if !%{use_static_glfw}
NEW_FLAGS="-I/usr/include/GLFW"
%endif
%if !%{use_static_rtaudio}
NEW_FLAGS="$NEW_FLAGS -I/usr/include/rtaudio"
%endif

echo "CXXFLAGS += $NEW_FLAGS `pkg-config --cflags gtk+-x11-3.0` -I$CURRENT_PATH/include -I$CURRENT_PATH/dep/include -I$CURRENT_PATH/dep/nanovg/src -I$CURRENT_PATH/dep/nanovg/example -I/usr/include/rtmidi -I$CURRENT_PATH/dep/nanosvg/src -I$CURRENT_PATH/dep/oui-blendish -I$CURRENT_PATH/dep/osdialog -I$CURRENT_PATH/dep/pffft -I$CURRENT_PATH/dep/include -I$CURRENT_PATH/dep/fuzzysearchdatabase/src" >> compile.mk

%if %{use_static_glfw}
echo "Use Static GLFW"
%else
echo "Do not use static GLFW"
%endif
%if %{use_static_rtaudio}
echo "Use Static RTAUDIO"
%else
echo "Do not use static RTAUDIO"
%endif

sed -i -e "s/-Wl,-Bstatic//g" Makefile

sed -i -e "s/dep\/lib\/libGLEW.a/-lGLEW/g" Makefile
%if !%{use_static_glfw}
sed -i -e "s/dep\/lib\/libglfw3.a/-lglfw/g" Makefile
%else
sed -i -e "s/dep\/lib\/libglfw3.a/dep\/%{_lib}\/libglfw3.a/g" Makefile
%endif
sed -i -e "s/dep\/lib\/libjansson.a/-ljansson/g" Makefile
sed -i -e "s/dep\/lib\/libcurl.a/-lcurl/g" Makefile
sed -i -e "s/dep\/lib\/libssl.a/-lssl/g" Makefile
sed -i -e "s/dep\/lib\/libcrypto.a/-lcrypto/g" Makefile
sed -i -e "s/dep\/lib\/libzip.a/-lzip/g" Makefile
sed -i -e "s/dep\/lib\/libz.a/-lz/g" Makefile
sed -i -e "s/dep\/lib\/libspeexdsp.a/-lspeexdsp/g" Makefile
sed -i -e "s/dep\/lib\/libsamplerate.a/-lsamplerate/g" Makefile
sed -i -e "s/dep\/lib\/librtmidi.a/-lrtmidi/g" Makefile
sed -i -e "s/dep\/lib\/libarchive.a/-larchive/g" Makefile
sed -i -e "s/dep\/lib\/libzstd.a/-lzstd/g" Makefile
# We use provided RtAudio library because Rack hangs when using jack and fedora rtaudio
%if !%{use_static_rtaudio}
sed -i -e "s/dep\/lib\/librtaudio.a/-lrtaudio -lpulse-simple -lpulse/g" Makefile
%else
sed -i -e "s/dep\/lib\/librtaudio.a/dep\/%{_lib}\/librtaudio.a -lpulse-simple -lpulse/g" Makefile
%endif

tar xvfz %{SOURCE1}

# Remove rpath
sed -i -e "/-rpath/d" Makefile
sed -i -e "/-rpath/d" plugin.mk

%build

CURRENT_PATH=`pwd`
export CFLAGS="`pkg-config --cflags gtk+-x11-3.0` -I$CURRENT_PATH/include -I$CURRENT_PATH/dep/include -I$CURRENT_PATH/dep/nanovg/src -I$CURRENT_PATH/dep/nanovg/example -I/usr/include/rtmidi -I$CURRENT_PATH/dep/nanosvg/src -I$CURRENT_PATH/dep/oui-blendish -I$CURRENT_PATH/dep/osdialog -I$CURRENT_PATH/dep/pffft -I$CURRENT_PATH/dep/include -I$CURRENT_PATH/dep/fuzzysearchdatabase/src"
export CXXFLAGS=
export LDFLAGS=

cd dep
%if %{use_static_glfw}
cd glfw
cmake -DCMAKE_INSTALL_PREFIX=.. -DGLFW_COCOA_CHDIR_RESOURCES=OFF -DGLFW_COCOA_MENUBAR=ON -DGLFW_COCOA_RETINA_FRAMEBUFFER=ON -DCMAKE_BUILD_TYPE=DEBUG .
make
make install
cd ..
%endif
%if %{use_static_rtaudio}
cd rtaudio
cmake -DCMAKE_INSTALL_PREFIX=.. -DCMAKE_CXX_FLAGS=-fPIC -DBUILD_SHARED_LIBS=FALSE -DCMAKE_BUILD_TYPE=DEBUG .
make
make install
cd ..
%endif
cd ..

%make_build PREFIX=/usr LIBDIR=%{_lib}

%install 

mkdir -p %{buildroot}%{_bindir}/
mkdir -p %{buildroot}%{_datadir}/pixmaps/
mkdir -p %{buildroot}%{_datadir}/man/man1/
mkdir -p %{buildroot}%{_datadir}/applications/
mkdir -p %{buildroot}%{_datadir}/Rack/doc/
mkdir -p %{buildroot}%{_libexecdir}/Rack2/plugins/
mkdir -p %{buildroot}%{_libdir}/

install -m 755 Rack         %{buildroot}%{_bindir}/Rack2
install -m 644 res/icon.png %{buildroot}%{_datadir}/pixmaps/rack.png
cp -r res                   %{buildroot}%{_libexecdir}/Rack2/
install -m 755 libRack.so   %{buildroot}%{_libdir}/

cp -r manual/* %{buildroot}%{_datadir}/Rack/doc/

cp cacert.pem Core.json template.vcv %{buildroot}%{_libexecdir}/Rack2/

cat > %{buildroot}%{_datadir}/applications/Rack2.desktop << EOF
[Desktop Entry]
Name=Rack2
Comment=A modular Synthesizer.
Exec=/usr/bin/Rack2
Type=Application
Terminal=0
Icon=/usr/share/pixmaps/rack.png
Categories=AudioVideo;
EOF

%files
%doc README.md CHANGELOG.md
%license LICENSE-GPLv3.txt LICENSE-dist.md LICENSE.md
%{_bindir}/*
%{_datadir}/*
%{_libexecdir}/*
%{_libdir}/*

%files doc
%{_datadir}/*

%changelog
* Sun Feb 27 2022 Yann Collette <ycollette.nospam@free.fr> - 2.1.0-1
- update to v2.1.0-1

* Sun Jan 16 2022 Yann Collette <ycollette.nospam@free.fr> - 2.0.6-1
- update to v2.0.6-1

* Sat Jan 01 2022 Yann Collette <ycollette.nospam@free.fr> - 2.0.5-1
- update to v2.0.5-1

* Sun Dec 19 2021 Yann Collette <ycollette.nospam@free.fr> - 2.0.4-1
- update to v2.0.4-1

* Tue Nov 30 2021 Yann Collette <ycollette.nospam@free.fr> - 2.0.3-1
- update to v2.0.3-1

* Tue Apr 06 2021 Yann Collette <ycollette.nospam@free.fr> - 1.1.6-13
- fix for wayland ...

* Sun Apr 04 2021 Yann Collette <ycollette.nospam@free.fr> - 1.1.6-12
- fix for pipewire ...

* Sun Nov 29 2020 Yann Collette <ycollette.nospam@free.fr> - 1.1.6-11
- fixing ...

* Sun Nov 29 2020 Yann Collette <ycollette.nospam@free.fr> - 1.1.6-10
- disable compilation flags

* Thu Oct 29 2020 Yann Collette <ycollette.nospam@free.fr> - 1.1.6-9
- update to 1.1.6-9

* Wed Jan 29 2020 Yann Collette <ycollette.nospam@free.fr> - 1.1.6-8
- update to 1.1.6-8

* Mon Jan 27 2020 Yann Collette <ycollette.nospam@free.fr> - 1.1.6-6
- update to 1.1.6

* Fri Oct 11 2019 Yann Collette <ycollette.nospam@free.fr> - 1.1.5-6
- update to 1.1.5

* Wed Dec 5 2018 Yann Collette <ycollette.nospam@free.fr> - 0.6.2c-6
- add static glew

* Wed Nov 28 2018 Yann Collette <ycollette.nospam@free.fr> - 0.6.2c-5
- fix compilation flags

* Mon Nov 26 2018 Yann Collette <ycollette.nospam@free.fr> - 0.6.2c-4
- add documentation package

* Mon Nov 26 2018 Yann Collette <ycollette.nospam@free.fr> - 0.6.2c-3
- update to 0.6.2c

* Mon Nov 26 2018 Yann Collette <ycollette.nospam@free.fr> - 0.6.2b
- fix global plugins loading

* Thu Nov 15 2018 Yann Collette <ycollette.nospam@free.fr> - 0.6.2b
- update to 0.6.2b

* Mon Oct 15 2018 Yann Collette <ycollette.nospam@free.fr> - 0.5.0
- update for Fedora 29

* Tue Dec 26 2017 Yann Collette <ycollette.nospam@free.fr> - 0.5.0
- update to version 0.5.0

* Wed Oct 25 2017 Yann Collette <ycollette.nospam@free.fr> - 0.4.0
- update to version 0.4.0

* Sat Jun 06 2015 Yann Collette <ycollette.nospam@free.fr> - 0.3.1
- Initial build
