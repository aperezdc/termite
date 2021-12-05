# Notable Changes

This file documents notable user-facing changes introduced in each release.

## v16.2

### Changed

- Update VTE subproject to version 0.66.2


## v16.1

### Added

- Make `Ctrl-+`, `Ctrl--`, and `Ctrl-=` are not usable in selection mode.

### Fixed

- Make `Ctrl-+` and `Ctrl--` work when the plus and minus keys from the
  numeric keypad are used.

### Changed

- Update VTE subproject to version 0.66.0.


## v16.0

### Added

- New `smart_copy` configuration option, which enables using `Ctrl-C` and
  `Ctrl-V` for copy-paste (instead of the usual `Ctrl-Shift-C` and
  `Ctrl-Shift-V`).
- New `clickable_url_ctrl` configuration option, which changes behaviour
  to require `Ctrl` to be pressed to act on detected URLs.
- Support dragging text and files onto Termite windows. Files are converted
  into their file system path.

### Changed

- Update VTE subproject to a prerelease of version 0.64.3.


## v15.3

### Added

- Make `PageDown` and `PageUp` work in command mode, moving by one screenful
  at a time (sans one line for context).

### Changed

- Update VTE subproject to a prerelease of version 0.64.3.


## v15.2

### Changed

- Update VTE subproject to version 0.64.1.
- Allow choosing values for the Meson `b_lto` and `b_ndebug` options.
- Depend on Meson 0.58, which allows installation with `--skip-subprojects`.
- Avoid using the deprecated `vte_terminal_spawn_sync()` function.

## Fixed

- Install configuration file correctly in `sysconfdir`.


## v15.1

### Added

- Movement and search commands now support an optional numeric count. For
  example `5j` will move the cursor five lines down.
- New `gtk_dark_theme` and `word_char_exceptions` configuration options.
- Running `termite --version` prints an additional line with the VTE version
  and the list of features it has been built with.

### Changed

- The build system will build and link statically a suitable version of
  the VTE library during compilation.

### Fixed

- Corrected off-by-one error in backward word movement after manually moving
  with `hjkl` past the end of the line's input.

### Removed

- The `TERM` environment variable is no longer set to `xterm-terminfo`, and
  the custom _terminfo_ entry is not supplied anymore. Instead, the values
  provided by VTE are used.

