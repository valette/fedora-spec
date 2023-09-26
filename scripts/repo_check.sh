#!/bin/bash

wget -q --spider http://google.com

if [ $? -eq 0 ]; then
    echo "Net connection OK"
else
    echo "No net connection"
    exit
fi

REPO_LIST="http://anongit.freedesktop.org/git/pulseaudio/pulseaudio.git
git://gabe.is-a-geek.org/git/inconcert
https://git.ardour.org/ardour/ardour
https://github.com/grame-cncm/faustlive
https://git.code.sf.net/p/guitarix/git
https://git.code.sf.net/p/isse/code
https://git.code.sf.net/p/jamin/code
https://git.code.sf.net/p/kwave/code
https://git.code.sf.net/p/mv-6pm/code
https://git.code.sf.net/p/pure-data/pd-anywhere
https://git.code.sf.net/p/pure-data/pd-extended
https://github.com/pure-data/pure-data
https://git.code.sf.net/p/qtgain/code
https://git.code.sf.net/p/rakarrack/git
https://git.code.sf.net/p/swami/code
https://git.code.sf.net/p/yoshimi/code
https://git.kernel.org/pub/scm/linux/kernel/git/clrkwllms/rt-tests
https://git.savannah.gnu.org/git/denemo.git
https://git.savannah.gnu.org/git/ll-plugins/azr3-jack.git
https://git.tuxfamily.org/gitroot/non/fltk
https://git.tuxfamily.org/gitroot/non/non
https://git.code.sf.net/p/liblo/git
https://repo.or.cz/juce-lv2
https://gitlab.winehq.org/wine/wine
http://git.drumgizmo.org/dgedit.git
http://git.drumgizmo.org/drumgizmo.git
http://git.elephly.net/software/lv2-mdametapiano
https://github.com/Miserlou/RJModules
https://github.com/stargateaudio/stargate
https://gitlab.com/unlessgames/unless_modules
https://github.com/agraef/purr-data
https://github.com/asb2m10/dexed
https://bitbucket.org/agraef/faust-lv2/src
https://bitbucket.org/xenakios/paulstretchplugin
https://codeberg.org/rtcqs/rtcqs
https://github.com/Dougal-s/Aether
https://git.assembla.com/portaudio
https://git.code.sf.net/p/backupband/code
https://git.code.sf.net/p/djv/git
https://git.code.sf.net/p/guvcview/git-master
https://git.code.sf.net/p/industrializer/code
https://git.code.sf.net/p/thmad/code
https://git.code.sf.net/p/timewave-synthesizer/code
https://github.com/23volts/23volts-vcv
https://github.com/50m30n3/SO-666
https://github.com/64MM4-KN1F3/AuntyLangtons-FREE
https://github.com/8bitbubsy/ft2-clone
https://github.com/8bitbubsy/pt2-clone
https://github.com/8Mode/8Mode-VCV_Modules
https://github.com/aaronkarp123/EarthTones
https://github.com/aaronstatic/AaronStatic_modules
https://github.com/Abjad/abjad
https://github.com/abluenautilus/SeasideModularVCV
https://github.com/abstrakraft/cwiid
https://github.com/adbrant/ArableInstruments
https://github.com/aetrion-music/aetrion-modular
https://github.com/agraef/midizap
https://github.com/agraef/purr-data
https://github.com/Ahineya/vcv-myth-plugin
https://github.com/ahlstromcj/seq66
https://github.com/ahlstromcj/sequencer64
https://github.com/Ahornberg/Ahornberg-VCV-Modules
https://github.com/airwindows/airwindows
https://github.com/alefnull/alefsbits
https://github.com/alexadam/img-encode
https://github.com/alexey-komarov/fruitsofkarma-vcvrack
https://github.com/alexkay/spek
https://github.com/algoritmarte/AlgoritmarteVCVPlugin
https://github.com/aliefhooghe/Gammou
https://github.com/alikins/Alikins-rack-plugins
https://github.com/AlliewayAudio/AlliewayAudio_Freebies
https://github.com/almostEric/FrozenWasteland
https://github.com/alto777/LFSR
https://github.com/AmalgamatedHarmonics/Prism
https://github.com/amsynth/amsynth
https://github.com/AnimatedCircuits/RackModules
https://github.com/antanasbruzas/abNinjam
https://github.com/apbianco/SerialRacker
https://github.com/aptrn/aP-Modules
https://github.com/aptrn/stocaudio-modules
https://github.com/Archie3d/aeolus_plugin
https://github.com/AriaSalvatrice/AriaVCVModules
https://github.com/aridacity/aridacityVCV
https://github.com/ArjoNagelhout/arjo_modules
https://github.com/asb2m10/dexed
https://github.com/AScustomWorks/AS
https://github.com/aubio/aubio
https://github.com/aubio/vamp-aubio-plugins
https://github.com/AuburnSounds/Dplug
https://github.com/audacity/audacity
https://github.com/Audiveris/audiveris
https://github.com/augustofilocamo/superOrgan
https://github.com/awwbees/BespokeSynth
https://github.com/axkg/terminatorX
https://github.com/axoloti/axoloti
https://github.com/ayyi/samplecat
https://github.com/azrrik/az-vcv
https://github.com/baconpaul/BaconPlugs
https://github.com/bafonso/Erratic
https://github.com/bbc/bbc-vamp-plugins
https://github.com/belangeo/cecilia5
https://github.com/belangeo/soundgrain
https://github.com/belangeo/zyne
https://github.com/bellard/quickjs
https://github.com/benkuper/Chataigne
https://github.com/BespokeSynth/BespokeSynth
https://github.com/bigfug/Fugio
https://github.com/bill-auger/loopidity
https://github.com/bill-brown/emap
https://github.com/blablack/ams-lv2
https://github.com/blablack/beatslash-lv2
https://github.com/blablack/deteriorate-lv2
https://github.com/blablack/midimsg-lv2
https://github.com/BlushAudioLab/BlushAudioVCVFreeModules
https://github.com/bogaudio/BogaudioModules
https://github.com/bokontep/BokontepByteBeatMachine
https://github.com/brummer10/CollisionDrive
https://github.com/brummer10/FatFrog.lv2
https://github.com/brummer10/Fluida.lv2
https://github.com/brummer10/GxMatchEQ.lv2
https://github.com/brummer10/GxPlugins.lv2
https://github.com/brummer10/GxReverseDelay.lv2
https://github.com/brummer10/gxtuner
https://github.com/brummer10/jalv_select
https://github.com/brummer10/LittleFly.lv2
https://github.com/brummer10/Mamba
https://github.com/brummer10/MetalTone
https://github.com/brummer10/screcord.lv2
https://github.com/brummer10/XDarkTerror.lv2
https://github.com/brummer10/XKeyboard.lv2
https://github.com/brummer10/XMixer.lv2
https://github.com/brummer10/Xmonk.lv2
https://github.com/brummer10/XPolyMonk.lv2
https://github.com/brummer10/XTinyTerror.lv2
https://github.com/brummer10/XTuner
https://github.com/brummer10/XUiDesigner
https://github.com/bubbapizza/alsacap
https://github.com/buddhi1980/mandelbulber2
https://github.com/Buzztrax/buzztrax
https://github.com/c0ntrol/veejay
https://github.com/calf-studio-gear/calf
https://github.com/calvinkosmatka/Kosmodules-Free
https://github.com/cappelnord/BenoitLib
https://github.com/captnfab/PianoBooster
https://github.com/catronomix/catro-blanco
https://github.com/catronomix/catro-modulo
https://github.com/cbdevnet/midimonster
https://github.com/cfoulc/cf
https://github.com/charlesfleche/lpd8editor
https://github.com/chinenual/Chinenual-VCV
https://github.com/ch-nry/VCV_nozori
https://github.com/chortlinghamster/modules
https://github.com/Chowdhury-DSP/BYOD
https://github.com/Chowdhury-DSP/ChowMatrix
https://github.com/chrisbeckstrom/Beckstrom_Research_Rack
https://github.com/christophhart/HISE
https://github.com/chronopoulos/annulus
https://github.com/chronopoulos/ziggurat
https://github.com/cinder/Cinder
https://github.com/clearly-broken-software/boomer
https://github.com/clearly-broken-software/drops
https://github.com/clearly-broken-software/nanoinvaders
https://github.com/clearly-broken-software/ninjas2
https://github.com/clearly-broken-software/Punch
https://github.com/clearly-broken-software/SoundBoard
https://github.com/clearly-broken-software/Stretcher
https://github.com/clearly-broken-software/Uprising
https://github.com/clone45/voxglitch
https://github.com/cnvogelg/captvolt-vcv
https://github.com/CoffeeVCV/CoffeeVCV
https://github.com/corrados/jamulus
https://github.com/cosinekitty/sapphire
https://github.com/countmodula/VCVRackLunettaModula
https://github.com/countmodula/VCVRackPlugins
https://github.com/crabacus/the-open-source-drumkit
https://github.com/cschol/modular80
https://github.com/CsoundQt/CsoundQt
https://github.com/cubeleco/aridacityVCV
https://github.com/curv3d/curv
https://github.com/cvde/RoomReverb
https://github.com/d3cod3/Mosaic
https://github.com/DaanDeMeyer/reproc
https://github.com/danfrz/PLEBTracker
https://github.com/danieldavies99/sequel
https://github.com/DanielRudrich/BeatAligningGuitarLooper
https://github.com/danmar/cppcheck
https://github.com/davekch/rchoices
https://github.com/david-c14/ModularFungi
https://github.com/david-c14/SubmarineFree
https://github.com/david-c14/SubmarineUtility
https://github.com/davy7125/polyphone
https://github.com/dbgrande/GrandeModular
https://github.com/dBiz/dBiz
https://github.com/dblanchemain/metaSurface
https://github.com/DCubix/Twist
https://github.com/deezer/spleeter
https://github.com/Delexander/Volume1
https://github.com/denischevalier/StalysVCVPlugin
https://github.com/desbma/r128gain
https://github.com/dfranx/SHADERed
https://github.com/dhemery/DHE-Modules/
https://github.com/dhuber81/huaba
https://github.com/diegodorado/TercerBrazo
https://github.com/digego/extempore
https://github.com/digitalhappens/ILovePerlin
https://github.com/digitalhappens/MyLittleTools
https://github.com/DISTRHO/Cardinal
https://github.com/DISTRHO/DISTRHO-Ports
https://github.com/DISTRHO/DISTRHO-Ports-Extra
https://github.com/DISTRHO/DPF
https://github.com/DISTRHO/gl-examples
https://github.com/DISTRHO/plugin-examples
https://github.com/DISTRHO/ProM
https://github.com/djpeterso23662/MrLumps
https://github.com/djpeterso23662/NocturnalEncoder
https://github.com/dllmusic/moDllz
https://github.com/docb/dbRackFormulaOne
https://github.com/docb/dbRackModules
https://github.com/docb/dbRackSequencer
https://github.com/DomiKamu/Ohmer
https://github.com/DominoMarama/ReTunesFree
https://github.com/dpilger26/NumCpp
https://github.com/dsacre/klick
https://github.com/dsheeler/harmonizer.lv2
https://github.com/dsheeler/tremelo.lv2
https://github.com/dyne/FreeJ
https://github.com/EaterOfSheep/Extratone
https://github.com/echolevel/protracker
https://github.com/eclab/flow
https://github.com/Edge-Modules/Edge
https://github.com/eh2k/fv1-emu
https://github.com/electronoora/komposter
https://github.com/elieserdejesus/JamTaba
https://github.com/ElvishArtisan/rivendell
https://github.com/EmissionControl2/EmissionControl2
https://github.com/emurray2/auraaudio-vcv-rack
https://github.com/EnigmaCurry/EnigmaCurry-vcv-pack
https://github.com/eres-j/VCVRack-plugin-JE
https://github.com/essej/freqtweak
https://github.com/essej/paulxstretch
https://github.com/essej/sonobus
https://github.com/essej/sooperlooper
https://github.com/ETCLabs/Sound2Light
https://github.com/evandelisle/showq
https://github.com/evgazloy/VO
https://github.com/expertsleepersltd/vcvrack-encoders
https://github.com/falkTX/Cadence
https://github.com/falkTX/Carla
https://github.com/falkTX/drmr
https://github.com/falkTX/dssi-vst
https://github.com/falkTX/non
https://github.com/falkTX/protrekkr
https://github.com/ffAudio/Frequalizer
https://github.com/FigBug/Organ
https://github.com/FigBug/Piano
https://github.com/FigBug/slPlugins
https://github.com/FigBug/Voc
https://github.com/flarn2006/SparketteVCV
https://github.com/FluidSynth/fluidsynth
https://github.com/foolswood/Physyn
https://github.com/FrancescoCeruti/linux-show-player
https://github.com/FrankBuss/FrankBussRackPlugin
https://github.com/freddyz/computerscare-vcv-modules
https://github.com/freesurfacemodules/FreeSurface
https://github.com/free-wheeling/freewheeling
https://github.com/gbevin/ReceiveMIDI
https://github.com/gbevin/SendMIDI
https://github.com/gbrandt1/southpole-vcvrack
https://github.com/Geekachuqt/3HR
https://github.com/generative-design/Code-Package-p5.js
https://github.com/geoffreybennett/alsa-scarlett-gui
https://github.com/geraldmwangi/GuitarMidi-LV2
https://github.com/gesellkammer/pyliblo3
https://github.com/gillesdegottex/fmit
https://github.com/giogramegna/mantra-master
https://github.com/gluethegiant/gtg-rack
https://github.com/GModal/ChaffVerb
https://github.com/gosub/forsitan-modulare
https://github.com/grame-cncm/faust
https://github.com/grame-cncm/faustworks
https://github.com/gratrix/vcv-gratrix
https://github.com/grough/lilac-loop-vcv
https://github.com/grough/lilac-modules-vcv
https://github.com/GuitarML/Chameleon
https://github.com/GuitarML/Proteus
https://github.com/GuitarML/SmartAmpPro
https://github.com/GuitarML/SmartGuitarAmp
https://github.com/GuitarML/SmartGuitarPedal
https://github.com/GuitarML/TS-M1N3
https://github.com/hampa/comfortzone
https://github.com/hannakoppelaar/h4n4-modules
https://github.com/hannesbraun/airwindows-lv2
https://github.com/hansfbaier/ultranova4linux
https://github.com/harryhaaren/avw.lv2
https://github.com/harryhaaren/jm2cv
https://github.com/hdavid/VCVRack-Holon.ist
https://github.com/helio-fm/helio-workstation
https://github.com/hemmer/bastl-vcv
https://github.com/hemmer/rebel-tech-vcv
https://github.com/hires/Dintree-Virtual
https://github.com/hitchhikr/protrekkr
https://github.com/HoerTech-gGmbH/tascar
https://github.com/Houston4444/Patchance
https://github.com/Houston4444/plujain-ramp
https://github.com/Houston4444/RaySession
https://github.com/HTlocal/VCV-Modules-HTLocal
https://github.com/hundredrabbits/Orca
https://github.com/hundredrabbits/Orca-c
https://github.com/hydrogen-music/hydrogen
https://github.com/ianlancetaylor/libbacktrace
https://github.com/iannix/Iannix
https://github.com/IggyLabs/IggyLabsModules
https://github.com/igorski/fogpad
https://github.com/imekon/PG-Instruments
https://github.com/Impro-Visor/Impro-Visor
https://github.com/infrasonicaudio/Infrasonic-VCV
https://github.com/initialed85/bespoke-synth-jams
https://github.com/isabelgk/IggyLabsModules
https://github.com/isivisi/questionablemodules
https://github.com/j4s0n-c/trowaSoft-VCV
https://github.com/jackaudio/jack1
https://github.com/jackaudio/jack2
https://github.com/jack-mixer/jack_mixer
https://github.com/jackokring/KRTPluginA
https://github.com/jacktrip/jacktrip
https://github.com/janne808/kocmoc-rack-modules
https://github.com/jatinchowdhury18/Agave
https://github.com/jatinchowdhury18/AnalogTapeModel
https://github.com/jatinchowdhury18/ChowDSP-VCV
https://github.com/jatinchowdhury18/ChowPhaser
https://github.com/jatinchowdhury18/KlonCentaur
https://github.com/jberg/milkdrop-editor-electron
https://github.com/jean-emmanuel/loop192
https://github.com/jean-emmanuel/open-stage-control
https://github.com/jensschulze/GoodSheperd
https://github.com/jeremymuller/Sha-Bang-Modules
https://github.com/jeremysalwen/Aubio-LV2-Plugins
https://github.com/jeremysalwen/kn0ck0ut-LV2
https://github.com/jeremysalwen/lv2file
https://github.com/jeremysalwen/Minicomputer-LV2
https://github.com/jeremysalwen/So-synth-LV2
https://github.com/jeremywen/JW-Modules
https://github.com/jerrysievert/synthkit
https://github.com/jerryuhoo/Fire
https://github.com/jhoar/AmalgamatedHarmonics
https://github.com/jiixyj/loudness-scanner
https://github.com/jimallman/interrobang-rack-modules
https://github.com/jjazzboss/JJazzLab-X
https://github.com/JoakimLindbom/JLmod
https://github.com/Joeboy/joeboy-lv2-plugins
https://github.com/joelrobichaud/Nohmad
https://github.com/johnnymurf/Unforgettable-Luncheon
https://github.com/josbouten/Sculpt-O-Sound
https://github.com/jpcima/ADLplug
https://github.com/jpcima/Bass21
https://github.com/jpcima/DelayArchitect
https://github.com/jpcima/ensemble-chorus
https://github.com/jpcima/fverb
https://github.com/jpcima/HybridReverb2
https://github.com/jpcima/midiwake
https://github.com/jpcima/spectacle
https://github.com/jpcima/stone-phaser
https://github.com/jpcima/string-machine
https://github.com/jperler/bezie
https://github.com/json-c/json-c
https://github.com/JTriggerFish/TriggerFish-VCV
https://github.com/juce-framework/JUCE
https://github.com/JustMog/Mog-VCV
https://github.com/jwagner/playitslowly
https://github.com/KarateSnoopy/vcv-karatesnoopy
https://github.com/karldd/Alchemy
https://github.com/kauewerner/Axioma
https://github.com/Kautenja/PotatoChips
https://github.com/Kautenja/RackNES
https://github.com/kellydimmick/TheEyeHarp
https://github.com/kenrestivo/Linux-synth-patches
https://github.com/kilpatrickaudio/Kilpatrick-Toolbox
https://github.com/kmatheussen/mammut
https://github.com/kmatheussen/radium
https://github.com/knchaffin/Meander
https://github.com/kockie69/RPJ
https://github.com/kockie69/SquinkyVCV-main
https://github.com/kokizzu/talentledhack
https://github.com/kometbomb/klystrack
https://github.com/koralfx/Koralfx-Modules
https://github.com/KoreTeknology/Quadraphonic-Plugins-for-VCV-Rack
https://github.com/korfuri/WhatTheRack
https://github.com/kragen/viznut-music
https://github.com/kunitoki/juced
https://github.com/kushview/Element
https://github.com/LabSevenDevVCVRack/LabSeven_VCVRack_modules
https://github.com/lenmus/lenmus
https://github.com/lenmus/lomse
https://github.com/leomccormack/SPARTA
https://github.com/leomccormack/Spatial_Audio_Framework
https://github.com/libermnnn/MpSeries
https://github.com/lighttroupe/luz
https://github.com/linuxaudio/new-session-manager
https://github.com/linuxmao-org/fogpad-port
https://github.com/linuxmao-org/Frontieres
https://github.com/linuxmao-org/Mx44
https://github.com/linuxmao-org/VL1-emulator
https://github.com/livecd-tools/livecd-tools
https://github.com/lkdjiin/SwitchesModules
https://github.com/llloret/osmid
https://github.com/LMMS/assets
https://github.com/LMMS/lmms
https://github.com/logsol/pd-pulp
https://github.com/LOGUNIVPM/LOGinstruments
https://github.com/LomasModules/LomasModules
https://github.com/loudnumbers/loudnumbers_vcv
https://github.com/LouisGorenfeld/DigitsVst
https://github.com/LuaAV/LuaAV
https://github.com/lucianodato/noise-repellent
https://github.com/lv2/lv2
https://github.com/lvtk/lvtk
https://github.com/Lyqst/cvly-modules
https://github.com/MaartenBaert/ssr
https://github.com/madskjeldgaard/awesome-supercollider
https://github.com/magnusjonsson/qin
https://github.com/mahlenmorris/VCVRack
https://github.com/mandelbulb-4d/mandelbulb-4d
https://github.com/mapmapteam/mapmap
https://github.com/MarcBoule/Geodesics
https://github.com/MarcBoule/ImpromptuModular
https://github.com/MarcBoule/MindMeldModular
https://github.com/markandrus/Sonify
https://github.com/markusschwenk/midieditor
https://github.com/marsyas/marsyas
https://github.com/martin-lueders/ML_modules
https://github.com/mathigatti/midi2voice
https://github.com/max-circlefade/Circlefade
https://github.com/memononen/libtess2
https://github.com/metabrainz/libcoverart
https://github.com/mgunyho/Little-Utils
https://github.com/mgunyho/PdArray
https://github.com/mhampton/ZetaCarinaeModules
https://github.com/mhetrick/hetrickcv
https://github.com/mhetrick/nonlinearcircuits
https://github.com/michaelwillis/dragonfly-reverb
https://github.com/mikeallisonJS/vcv-CaptainsSounds
https://github.com/milanboers/pytune
https://github.com/milkytracker/MilkyTracker
https://github.com/mixxxdj/mixxx
https://github.com/MockbaTheBorg/MockbaModular
https://github.com/moddevices/caps-lv2
https://github.com/momentarylapse/tsunami
https://github.com/monocasual/giada
https://github.com/mortuosplango/beenoir
https://github.com/MrKepzie/Natron
https://github.com/mrletourneau/strong_kar
https://github.com/mschack/VCV-Rack-Plugins
https://github.com/MTG/miredu
https://github.com/MtnViewJohn/context-free
https://github.com/mtsch/mtsch-vcvrack-plugins
https://github.com/mtytel/helm
https://github.com/mtytel/vital
https://github.com/muammar/mkchromecast
https://github.com/munt/munt
https://github.com/musescore/MuseScore
https://github.com/musescore/sftools
https://github.com/muse-sequencer/muse
https://github.com/Music-and-Culture-Technology-Lab/omnizart
https://github.com/Myst-Mach/mmmodules
https://github.com/mzuther/K-Meter
https://github.com/mzuther/traKmeter
https://github.com/n0jo/rackwindows
https://github.com/nanomsg/nanomsg
https://github.com/napframework/nap
https://github.com/naus3a/NauModular
https://github.com/neilcosgrove/LNX_Studio
https://github.com/netboy3/21kHz-rack-plugins
https://github.com/netboy3/MSM-vcvrack-plugin
https://github.com/NicolasNeubauer/noobhour_modules
https://github.com/nicoroulet/moog
https://github.com/nielszweistein/skjack-vcv2
https://github.com/NikolaiVChr/Autinn
https://github.com/ninodewit/SHIRO-Plugins
https://github.com/njh/rotter
https://github.com/njh/silentjack
https://github.com/nodebox/nodebox
https://github.com/nodebox/nodebox-pyobjc
https://github.com/noedigcode/konfyt
https://github.com/NonLinearInstruments/NLNRI_VCVRackPlugins
https://github.com/NoraCodes/fives
https://github.com/olegkapitonov/Kapitonov-Plugins-Pack
https://github.com/oli-kester/kepler34
https://github.com/openAVproductions/openAV-ArtyFX
https://github.com/OpenBoard-org/OpenBoard
https://github.com/openframeworks/openFrameworks
https://github.com/ossia/score
https://github.com/OSSIA/score
https://github.com/oswald2/DGPatchMaker
https://github.com/osxmidi/linvst
https://github.com/oxesoft/oxefmsynth
https://github.com/pantherb/setBfree
https://github.com/patheros/PathSetModules
https://github.com/PaulBatchelor/lmms-reverbsc
https://github.com/PaulBatchelor/LMMS-Signal
https://github.com/PaulBatchelor/LMMS-Sporth
https://github.com/paulnasca/paulstretch_cpp
https://github.com/paulpacifico/shutter-encoder
https://github.com/pawal/ask-vcv-modules
https://github.com/paynebc/tunefish
https://github.com/pdesaulniers/wolf-shaper
https://github.com/pd-l2ork/pd-l2ork
https://github.com/pertusa/UAVampPlugins
https://github.com/pete-gordon/hivelytracker
https://github.com/pfzzz/rack-plugin
https://github.com/pgiblock/lmms-lv2
https://github.com/phdsg/PvC
https://github.com/philippesalembier/SckitamVCV
https://github.com/phusion/debian-packaging-for-the-modern-developer
https://github.com/pierreguillot/Camomile
https://github.com/PiOverFour/MPK-M2-editor
https://github.com/pjz/amuc
https://github.com/pknodle/WeldSplatter
https://github.com/polyeffects/PolyLV2
https://github.com/PolyMeilex/Neothesia
https://github.com/portalmod/mda-lv2
https://github.com/portalmod/mod-distortion
https://github.com/portalmod/mod-pitchshifter
https://github.com/portalmod/swh-lv2
https://github.com/portalmod/tap-lv2
https://github.com/portaloffreedom/pipecontrol
https://github.com/powertab/powertabeditor
https://github.com/praxis-live/examples
https://github.com/praxis-live/praxis
https://github.com/praxis-live/praxis-live
https://github.com/premake/premake-core
https://github.com/Prichman/famitracker-qt
https://github.com/processing/processing4
https://github.com/progwolff/performer
https://github.com/projectM-visualizer/projectm
https://github.com/PySimpleGUI/PySimpleGUI
https://github.com/Qirky/FoxDot
https://github.com/raboof/realtimeconfigquickscan
https://github.com/raboof/sfArkLib
https://github.com/raboof/sfarkxtc
https://github.com/radarsat1/LoopDub
https://github.com/rafael2k/darkice
https://github.com/rafaelmardojai/blanket
https://github.com/raincheque/qwelk
https://github.com/RareBreeds/Orbits
https://github.com/RCameron93/FehlerFabrik
https://github.com/Rcomian/rcm-modules
https://github.com/rdybka/vht
https://github.com/reales/OB-Xd
https://github.com/reduz/zytrax
https://github.com/rerrahkr/BambooTracker
https://github.com/reuk/wayverb
https://github.com/rghvdberg/ninjas2
https://github.com/RichardHladik/outotune
https://github.com/rmosquito/vcv-mosquito
https://github.com/rncbc/drumkv1
https://github.com/rncbc/padthv1
https://github.com/rncbc/qjackctl
https://github.com/rncbc/qmidinet
https://github.com/rncbc/qsynth
https://github.com/rncbc/qtractor
https://github.com/rncbc/rtirq
https://github.com/rncbc/samplv1
https://github.com/rncbc/synthv1
https://github.com/robbert-vdh/yabridge
https://github.com/rock-hopper/shuriken
https://github.com/RODENTCAT/RODENTMODULES
https://github.com/RomanKubiak/ctrlr
https://github.com/romi1502/MrFreeze
https://github.com/rorywalsh/cabbage
https://github.com/RPTools/maptool
https://github.com/rumblesan/improviz
https://github.com/sadko4u/lsp-plugins
https://github.com/sadko4u/tamgamp.lv2
https://github.com/sadko4u/timbre-mill
https://github.com/salsaman/LiVES
https://github.com/salvolm84/SLM-vcv-rack
https://github.com/samaaron/sonic-pi
https://github.com/sampov2/foo-yc20
https://github.com/scanner-darkly/vcv-collection-one
https://github.com/schismtracker/schismtracker
https://github.com/Sciss/Eisenkraut
https://github.com/sebastien-bouffier/Bidoo
https://github.com/alex-tee/ztoolkit
https://github.com/sgossner/VSCO-2-CE
https://github.com/sickozell/SickoCV
https://github.com/signal-flux/Signal-Flux-VCV-Rack-Modules
https://github.com/sindarknave/EucQuant
https://github.com/sjaehn/BAngr
https://github.com/sjaehn/BChoppr
https://github.com/sjaehn/BHarvestr
https://github.com/sjaehn/BJumblr
https://github.com/sjaehn/BOops
https://github.com/sjaehn/BSchaffl
https://github.com/sjaehn/Bsequencer
https://github.com/sjaehn/BSEQuencer
https://github.com/sjaehn/BShapr
https://github.com/sjaehn/BSlizr
https://github.com/sjaehn/BSpacr
https://github.com/Skrylar/skjack-vcv
https://github.com/Skrylar/skylights-vcv
https://github.com/smbddha/sb-StochKit
https://github.com/smbolton/stretchplayer
https://github.com/snappy46/GuitarixDroid
https://github.com/snappy46/GuitarixMidiController
https://github.com/s-ol/vcvmods
https://github.com/sonejostudios/DeLooper
https://github.com/sonejostudios/SuperBeatRepeater
https://github.com/soul-lang/SOUL
https://github.com/SoundScapeRenderer/ssr
https://github.com/Soundux/Soundux
https://github.com/sourcefabric/airtime
https://github.com/spark404/jalmus
https://github.com/SpartanJ/efsw
https://github.com/SpektroAudio/Seasons
https://github.com/SpotlightKid/ykchorus
https://github.com/ssj71/infamousPlugins
https://github.com/ssj71/OSC2MIDI
https://github.com/ssj71/reMID.lv2
https://github.com/ssj71/rkrlv2
https://github.com/stargateaudio/pymarshal
https://github.com/stargateaudio/stargate
https://github.com/starlingcode/Via-for-Rack
https://github.com/stavrosdidakis/Motion-Tracking
https://github.com/Stazed/rakarrack-plus
https://github.com/Stazed/seq42
https://github.com/steinbergmedia/vst3sdk
https://github.com/steveb/gula-plugins
https://github.com/SteveRussell33/Prism
https://github.com/stevie67/loopor
https://github.com/stoermelder/vcvrack-packone
https://github.com/Strum/Strums_Mental_VCV_Modules
https://github.com/Stubs42/OrangeLine
https://github.com/StudioSixPlusOne/rack-modules
https://github.com/stump/libsmf
https://github.com/sumpygump/quantal-audio
https://github.com/supercollider/sc3-plugins
https://github.com/supercollider/supercollider
https://github.com/supergilbert/midilooper
https://github.com/surfacepatterns/synthclone
https://github.com/surge-synthesizer/midi-monitor
https://github.com/surge-synthesizer/monique-monosynth
https://github.com/surge-synthesizer/shortcircuit3
https://github.com/surge-synthesizer/shortcircuit-xt
https://github.com/surge-synthesizer/stochas
https://github.com/surge-synthesizer/surge
https://github.com/surge-synthesizer/surge-rack
https://github.com/surge-synthesizer/tuning-workbench-synth
https://github.com/SVModular/CharredDesert
https://github.com/SVModular/DrumKit
https://github.com/swami/swami
https://github.com/swesterfeld/spectmorph
https://github.com/swh/lv2
https://github.com/swh/timemachine
https://github.com/taylordotfish/freeze
https://github.com/technomancy/leiningen
https://github.com/teletypist/stochasm
https://github.com/terrytheplatypus/Plurm
https://github.com/thargor6/mb3d
https://github.com/theAeon/JDSP4Linux/
https://github.com/The-Great-Assyr/Chiptuner
https://github.com/The-Modular-Mind/oscelot
https://github.com/theskylander/Skylander-plugins
https://github.com/TheWaveWarden/odin2
https://github.com/thomassidor/tinytricks
https://github.com/thp/wavbreaker
https://github.com/tialaramex/njl-plugins
https://github.com/tildearrow/furnace
https://github.com/TimeControlledOrganism/LifeFormModular
https://github.com/tim-janik/beast
https://github.com/timothyschoen/PlugData
https://github.com/tlsa/libcyaml
https://github.com/tomdasilva/Mojo
https://github.com/Tonecarver/tcRackModules
https://github.com/travisat/Truly
https://github.com/tresf/hydrogen-drumkits
https://github.com/trummerschlunk/master_me
https://github.com/turcofran/omfootctrl
https://github.com/TuriSc/hydrogen2drumkv1.py
https://github.com/txmod/TXModular
https://github.com/ValleyAudio/ValleyRackFree
https://github.com/VCVRack/AudibleInstruments
https://github.com/VCVRack/Befaco
https://github.com/VCVRack/ESeries
https://github.com/VCVRack/Fundamental
https://github.com/VCVRack/Rack
https://github.com/VCVRack/VCV-Prototype
https://github.com/VCVRack/VCV-Recorder
https://github.com/VegaDeftwing/LyraeModules
https://github.com/VegaDeftwing/PinkTromboneVCV
https://github.com/very-cool-name/MicMusic-VCV
https://github.com/vokimon/python-wavefile
https://github.com/wacossusca34/glava
https://github.com/Wasted-Audio/hvcc
https://github.com/Wasted-Audio/ryukau_LV2Plugins
https://github.com/WeirdConstructor/HexoSynth
https://github.com/weldr/lorax
https://github.com/werman/noise-suppression-for-voice
https://github.com/williamweston/phasex
https://github.com/wilsontr/ChordController
https://github.com/wineasio/wineasio
https://github.com/wiqid/anomalies
https://github.com/wiqid/repelzen
https://github.com/Wohlstand/OPL3BankEditor
https://github.com/Wohlstand/OPN2BankEditor
https://github.com/wolf-plugins/wolf-shaper
https://github.com/WrongPeople/WrongPeopleVCV
https://github.com/wschweer/sftools
https://github.com/x42/avldrums.lv2
https://github.com/x42/balance.lv2
https://github.com/x42/controlfilter.lv2
https://github.com/x42/darc.lv2
https://github.com/x42/dpl.lv2
https://github.com/x42/fat1.lv2
https://github.com/x42/fil4.lv2
https://github.com/x42/gmsynth.lv2
https://github.com/x42/harvid
https://github.com/x42/matrixmixer.lv2
https://github.com/x42/mclk.lv2
https://github.com/x42/meters.lv2
https://github.com/x42/midifilter.lv2
https://github.com/x42/mixtri.lv2
https://github.com/x42/mtc.lv2
https://github.com/x42/nodelay.lv2
https://github.com/x42/phaserotate.lv2
https://github.com/x42/plumbing.lv2
https://github.com/x42/repitch.lv2
https://github.com/x42/scarlett-mixer
https://github.com/x42/sisco.lv2
https://github.com/x42/spectra.lv2
https://github.com/x42/stepseq.lv2
https://github.com/x42/testsignal.lv2
https://github.com/x42/tuna.lv2
https://github.com/x42/xfade.lv2
https://github.com/x42/xjadeo
https://github.com/x42/zconvo.lv2
https://github.com/xaviershay/vitamin-vcv-modules
https://github.com/Xenakios/Atelier
https://github.com/ycollet/ams
https://github.com/ycollet/horgand
https://github.com/ycollet/jackmidilogger
https://github.com/ycollet/mod-pitchshifter
https://github.com/ycollet/MrFreeze
https://github.com/ycollet/non
https://github.com/ycollet/ntk
https://github.com/ycollet/psi-plugins
https://github.com/ycollet/rakarrack
https://github.com/ycollet/vopa
https://github.com/yoyz/audio
https://github.com/YruamaLairba/yru-simple-LV2-C
https://github.com/zamaudio/zam-plugins
https://github.com/zbanks/radiance
https://github.com/zezic/ZZC
https://github.com/zrythm/ZPlugins
https://github.com/zynaddsubfx/zynaddsubfx
https://github.com/zynaddsubfx/zyn-fusion-build
https://github.com/zynayumi/zynayumi
https://github.com/zynthian/zynthian-data
https://git.kernel.org/pub/scm/utils/rt-tests/rt-tests
https://gitlab.com/ayrsd/audiostellar
https://gitlab.com/davethecomposer/platonic-music-engine
https://gitlab.com/drobilla/lv2lint
https://gitlab.com/genhydro/genhydro
https://gitlab.com/hampton-harmonics/hampton-harmonics-modules
https://gitlab.com/jeremy_mitchell/sunsetsignals
https://gitlab.com/lebiniou/lebiniou
https://gitlab.com/lebiniou/lebiniou-data
https://gitlab.com/LibreArp/LibreArp
https://gitlab.com/NaN9/geohead
https://gitlab.com/samplehive/sample-hive
https://gitlab.com/sat-metalab/splash
https://gitlab.com/smart-pattern/valentina
https://gitlab.com/sonusdept/loopus
https://gitlab.com/sonusdept/sonusmodular
https://gitlab.com/then-try-this/samplebrain
https://gitlab.domainepublic.net/bipscript/bipscript
https://gitlab.domainepublic.net/bipscript/ide
https://gitlab.freedesktop.org/pipewire/pipewire
https://git.laborejo.org/lss/agordejo
https://git.laborejo.org/lss/argodejo
https://gitlab.xiph.org/xiph/postfish
https://git.open-music-kontrollers.ch/lv2/mephisto.lv2
https://git.open-music-kontrollers.ch/lv2/tracker.lv2
https://git.savannah.gnu.org/git/solfege
https://git.savannah.gnu.org/git/traverso
https://git.savannah.nongnu.org/git/dino
https://git.savannah.nongnu.org/git/getfem
https://git.s-ol.nu/vcvmods
https://git.sr.ht/~alextee/zrythm-libcyaml
https://git.sr.ht/~rabbits/orca
https://git.tuxfamily.org/non/non.git
https://github.com/zrythm/libaudec
https://github.com/zrythm/ZLFO
https://github.com/zrythm/zrythm
https://github.com/zrythm/zrythm-media
https://invent.kde.org/graphics/kxstitch
https://invent.kde.org/multimedia/subtitlecomposer
https://github.com/Vampouille/superboucle
https://pagure.io/fedora-kickstarts
https://pagure.io/fedora-misc-package-utilities
https://salsa.debian.org/multimedia-team/portsmf
https://github.com/rncbc/jack_link
https://github.com/HoerTech-gGmbH/tascar
https://github.com/saugns/saugns
https://github.com/tank-trax/ddsp-vst
https://github.com/mikerodd/june-21
https://github.com/zen-kernel/zen-kernel
https://github.com/xanmod/linux
https://github.com/GModal/vSwell
https://github.com/pierreguillot/Camomile
https://github.com/GuitarML/PrincePedal
https://github.com/bsutherland/JuceOPLVSTi
https://github.com/FigBug/SN76489
https://github.com/GrandOrgue/grandorgue
https://github.com/izzyreal/vmpc-juce
https://github.com/ryukau/VSTPlugins
https://github.com/pd3v/line
https://github.com/kosua20/MIDIVisualizer
https://github.com/mikeoliphant/neural-amp-modeler-lv2
https://github.com/AidaDSP/AIDA-X
https://github.com/tote-bag-labs/valentine
https://github.com/DISTRHO/DPF-Plugins
https://github.com/dagargo/elektroid
https://github.com/DISTRHO/Ildaeil
https://github.com/moddevices/mod-neural-amp
https://github.com/moddevices/mod-cv-plugins
https://github.com/moddevices/mod-utilities
https://github.com/moddevices/mod-system-plugins
https://github.com/x42/stereoroute.lv2
https://github.com/x42/onsettrigger.lv2
https://github.com/x42/midimap.lv2
https://github.com/x42/midigen.lv2
https://github.com/x42/mididebug.lv2
https://github.com/DISTRHO/DIE-Plugins
https://github.com/jdf/processing.py
https://git.open-music-kontrollers.ch/~hp/eteroj.lv2
https://git.open-music-kontrollers.ch/~hp/mephisto.lv2
https://git.open-music-kontrollers.ch/~hp/midi_matrix.lv2
https://git.open-music-kontrollers.ch/~hp/moony.lv2
https://git.open-music-kontrollers.ch/~hp/orbit.lv2
https://git.open-music-kontrollers.ch/~hp/patchmatrix
https://git.open-music-kontrollers.ch/~hp/sherlock.lv2
https://git.open-music-kontrollers.ch/~hp/synthpod
https://github.com/rogerallen/dxsyx
https://github.com/dcoredump/dexed.lv2
https://github.com/fps/fps-plugins.lv2
https://git.code.sf.net/p/rosegarden/git
https://github.com/psemiletov/drumrox
https://github.com/ccrma/chuck
https://github.com/ccrma/miniAudicle
https://github.com/bboettcher3/gRainbow
https://github.com/psemiletov/drumrox-kits
https://github.com/kometbomb/prototracker-modular
https://github.com/StrangeLoopsAudio/Harmonigon
https://github.com/michelesr/jack-oscillator
https://github.com/sjoerdvankreel/infernal-synth
https://github.com/steinbergmedia/vst3sdk
https://github.com/khrykin/BlackBird
https://github.com/attilammagyar/js80p
https://github.com/blackboxdsp/rotor
https://github.com/allex-k/synth
https://github.com/sbadon122/ATLAS-06-Synthesizer
https://github.com/overtone/overtone
https://github.com/guysherman/si-plugins
https://github.com/AlisterH/gwc
https://github.com/tomscii/ir.lv2
https://github.com/calgoheen/cStop
https://github.com/chmaha/RCComp
https://github.com/chmaha/RCVerb
https://github.com/Chowdhury-DSP/ChowKick
https://github.com/getdunne/MOrgan
https://github.com/tobanteAudio/modEQ
https://github.com/sfztools/sfizz
https://github.com/sfztools/prelude.lv2
https://github.com/sfztools/toccata.lv2
https://github.com/sfztools/sfizz-ui
https://github.com/brummer10/neuralcapture
https://github.com/psemiletov/drumlabooh
https://github.com/FigBug/Wavetable
https://github.com/Stazed/non-mixer-xt
https://github.com/rerdavies/ToobAmp
https://git.iem.at/audioplugins/IEMPluginSuite
https://github.com/leomccormack/SPARTA
https://github.com/midilab/jc303
https://github.com/Geonkick-Synthesizer/geonkick
https://codeberg.org/obsoleszenz/equis"

if [ -f git_tags_new.txt ];
then
    mv git_tags_new.txt git_tags_old.txt
fi

for File in $REPO_LIST
do
    echo "Processing $File"
    ALL_TAGS="`git ls-remote --tags $File 2>&1 | grep -v redirect | sed -e "s/\^{}//g" | sort | uniq`"
    if [ ! -z "$ALL_TAGS" ];
    then
	for Tag in $ALL_TAGS
	do
	    echo "$File $Tag"
	    echo "$File $Tag" >> git_tags_new.txt
	done
    fi
done

# Get Zita updates
wget http://kokkinizita.linuxaudio.org/linuxaudio/downloads/index.html -O /tmp/index.html
cat /tmp/index.html | grep -oP "(HREF|href)=\"\K.+?(?=\")" | grep tar| sort >> git_tags_new.txt

if [ -f git_tags_old.txt ];
then
    echo -e "\n\n\n"
    echo "==================="
    echo "= Changes in tags ="
    echo "===================" 
    echo -e "\n\n\n"

    diff git_tags_new.txt git_tags_old.txt
fi

