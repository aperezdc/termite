# Changes to Termite

This fork of [Termite](https://github.com/thestinger/termite/) aims to do
maintenance on the code base and to that effect it has the following changes
over the upstream version:

- [Meson](https://mesonbuild.com) is used as build system.
- Instead of depending on [vte-ng](https://github.com/thestinger/vte-ng) being
  installed on the system, a more modern VTE version with a few needed patches
  is built into a static library (as a Meson subproject) and linked into the
  `termite` binary.
- The `TERM` environment variable is set to the value that VTE provides as
  default. If it is good enough for every other VTE-based terminal, it should
  be as well for Termite.
- Removed usage of `VTE_CHECK_VERSION()`, a recent version of VTE is always
  built as subproject and there is no need for these checks.

Additionally, this fork has the following PRs applied:

- https://github.com/thestinger/termite/pull/779 - Add config option to set VTE word character exceptions
- https://github.com/thestinger/termite/pull/742 - Added a generic name to the termite.desktop
- https://github.com/thestinger/termite/pull/734 - Add LICENSE file
- https://github.com/thestinger/termite/pull/682 - 2 fixes to backwards-word
- https://github.com/thestinger/termite/pull/443 - Vim movement count
