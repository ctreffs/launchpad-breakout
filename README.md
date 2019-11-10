# Breakout - Video game for Novation Launchpad Pro

<p align="center">
	<img src="breakout-launchpad.gif" height="300" alt="breakout launchpad pro"/>
</p>   

A basic version of [Breakout](https://en.wikipedia.org/wiki/Breakout_(video_game)) the 1976 video game for the [Novation Launchpad Pro](https://novationmusic.com/launch/launchpad-pro).

The project was created as part of an inhouse hackathon at [Agile Mobile Revolution (AMR) by 7P](https://7p-amr.com) in November 2019.

You may want to watch a [live-stream of its creation on Twitch](https://www.twitch.tv/videos/505513530) but be aware it's ~20h long XD.

### Important notice:
Beware that this firmware is **ONLY** available for and compatible with the Launchpad **PRO**!

## 🚀 Getting Started

These instructions will get your copy of the project up and running on your local machine.

### 📋 Prerequisites

* [Xcode](https://xcodereleases.com)
* [SysEx Librarian](https://www.snoize.com/SysExLibrarian/)
* [Homebrew](https://brew.sh)

### 💻 Installing

The project was developed on macOS. While it's available for more than one platform I will not describe setup on other platforms.
For more details on that please refer to the [firmware's readme](https://github.com/ctreffs/launchpad-pro/blob/master/README.md).

Install Xcode and a SysEx Librarian.

In Terminal.app run:

```sh
# dependencies for compiling firmware
brew tap PX4/homebrew-px4
brew install gcc-arm-none-eabi

# clone repo and submodules (!)
git clone --recursive https://github.com/ctreffs/launchpad-breakout.git
cd launchpad-breakout

# build a firmware sysex from code and copy it to sysex folder
make setupSysex
```

##### Repo structure:

```sh
Makefile       # Convenience functions to build and clean firmware.
README.md      # This file.
launchpad-pro/ # Submodule with firmware code + project files.
sysex/         # Folder with Launchpad firmware sysEx + custom firmware sysEx;
               # point your SysEx Librarian working dir to this folder.
```

### Patching the firmware

To get Breakout to run on your Launchpad Pro you have to patch the firmware with the custom firmware built by this project.


1. Connect your Launchpad Pro to your Mac.
2. Edit the firmware using the Simulator project in Xcode located at `<PROJECTDIR>/launchpad-pro/tools/osx/simulator.xcodeproj/` or run `make openXcode`. (You may as well just use the latest built firmware version in the sysex directory).
3. Compile the firmware and copy the compiled sysEx file to the sysex folder (`make setupSysex`).
4. Start your Launchpad Pro in update mode:
	1. Turn Launchpad off.
	2. Hold down setup button while turning Launchpad back on.
	3. You will see a static set of colored LEDs on the pad.
5. Open SysEx Librarian and select `Launchpad Pro` as `Destination`
6. In SysEx Librarian add `launchpad_pro.syx` from the sysex directory and select it.
7. Transfer sysEx to Launchpad by pressing `Play`.
8. The Launchpad Pro should display `Updating ...` running horizontally over the device.
9. The Launchpad Pro will restart after the update automatically.
10. You should see Breakout running on your device.

For more details on how to patch a firmware onto Launchpad Pro and reset it to the official firmware please refer to the [firmware readme](https://github.com/ctreffs/launchpad-pro/blob/master/README.md).


## ✍️ Authors

* [Christian Treffs @ChrisDailyGrind](https://github.com/ctreffs)
* [Manuel Weidmann @vyo](https://github.com/vyo)

Original firmware by <https://github.com/dvhdr/launchpad-pro>.   
Updated fork used with this project by <https://github.com/onionpsy/launchpad-pro>.

## 🔏 Licenses

This project is licensed under the 3-Clause BSD License - see the [LICENSE](LICENSE) file for details.

* [dvhdr/launchpad-pro](https://github.com/dvhdr/launchpad-pro) licensed under [3-clause BSD license](https://github.com/dvhdr/launchpad-pro/blob/master/LICENSE)
* [onionpsy/launchpad-pro](https://github.com/onionpsy/launchpad-pro) licensed under [3-clause BSD license](https://github.com/onionpsy/launchpad-pro/blob/master/LICENSE)
