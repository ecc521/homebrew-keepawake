# Homebrew Tap for keepawake

This is the official Homebrew Tap for [keepawake](https://github.com/ecc521/keepawake), a CLI that prevents an Apple Silicon Mac from sleeping when the lid is closed — no external display, no dummy HDMI plug, no kernel extension required. It's also a drop-in `caffeinate` replacement: it holds the same idle/display/disk/system sleep assertions caffeinate would, on top of defeating the hardware-enforced clamshell-sleep check.

## Installation

```bash
brew tap ecc521/keepawake
brew install ecc521/keepawake/keepawake
```

This builds from source (a small Swift CLI), since the tool relies on an undocumented private macOS API that can't be notarized for a prebuilt binary distribution.

## Updates

```bash
brew upgrade ecc521/keepawake/keepawake
```

## Usage

```bash
keepawake              # run until Ctrl-C
keepawake -t 3600      # run for 1 hour, then stop automatically
keepawake -- some-cmd  # hold the sleep-prevention for some-cmd's lifetime
```

See the [main repo](https://github.com/ecc521/keepawake) for full usage, known limitations, and the technical findings behind how this works.
