# Notable Changes

This file documents notable user-facing changes introduced in each release.

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

