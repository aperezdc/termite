=======
Termite
=======

A keyboard-centric VTE-based terminal, aimed at use within a window manager
with tiling and/or tabbing support.

Termite looks for the configuration file in the following order:
``$XDG_CONFIG_HOME/termite/config``, ``~/.config/termite/config``,
``$XDG_CONFIG_DIRS/termite/config``, ``/etc/xdg/termite/config``.

Termite's exit status is 1 on a failure, including a termination of the child
process from an uncaught signal. Otherwise the exit status is that of the child
process.


About this fork
---------------

.. admonition:: notice

   The old contents of thise file are available in `<README.old.rst>`__.

The original authors of Termite are now `recommending Alacritty`__, which is
indeed a fine terminal emulator; but it has a few shortcomings:

__ https://github.com/thestinger/termite#termite-is-obsoleted-by-alacritty

* Alacritty *requires* an OpenGL capable graphics card. While software
  rendering is possible, it is considerably slower. Termite can be used
  comfortably in systems without hardware accelerated graphics.
* While Alacritty's hints mode can be configured to behave similarly to
  Termite, it is *not exactly the same*. Some people may still prefer the
  user experience provided by Termite.
* Termite is written in C++, which is *more widely supported* than Rust.
  Alacritty currently does not work on architectures and operating systems
  where a Rust compiler is not available.

`Adrián Pérez <https://github.com/aperezdc>`__ tried to contact the main
author offering to continue development, without receiving a reply. While
the original Termite authors discourage forking and contributing to Alacritty
instead, we believe that there are reasons for Termite to continue existing,
and plan to continue maintenance. If you were planning on improving Termite
but were discouraged for lack of an active upstream, please do consider
contributing to this fork.


DEPENDENCIES
============

A slightly `modified version of VTE`__ exposing the necessary functions for
keyboard text selection and URL hints is built into Termite as a Meson
subproject, and is included in packaged releases__.

__ https://github.com/aperezdc/vte/tree/vte-0.64-termite
__ https://github.com/aperezdc/termite/releases

This means that you will need the dependencies needed to build VTE in order
to build Termite:

- Fribidi
- GPerf
- GTK+ 3.0
- GnuTLS
- PCRE2
- libsystemd

If no browser is configured and ``$BROWSER`` is unset, ``xdg-open`` from
xdg-utils is used as a fallback.

BUILDING
========
::

    git clone https://github.com/aperezdc/termite.git
    meson setup build termite
    meson compile -C build

INSTALLING
==========
::

    meson install -C build --skip-subprojects vte

Packagers may want to add ``--destdir=…`` to the above command.


KEYBINDINGS
===========

INSERT MODE
-----------

+----------------------+---------------------------------------------+
| ``ctrl-shift-x``     | activate url hints mode                     |
+----------------------+---------------------------------------------+
| ``ctrl-shift-r``     | reload configuration file                   |
+----------------------+---------------------------------------------+
| ``ctrl-shift-c``     | copy to CLIPBOARD                           |
+----------------------+---------------------------------------------+
| ``ctrl-shift-v``     | paste from CLIPBOARD                        |
+----------------------+---------------------------------------------+
| ``ctrl-shift-u``     | unicode input (standard GTK binding)        |
+----------------------+---------------------------------------------+
| ``ctrl-tab``         | start scrollback completion                 |
+----------------------+---------------------------------------------+
| ``ctrl-shift-space`` | start selection mode                        |
+----------------------+---------------------------------------------+
| ``ctrl-shift-t``     | open terminal in the current directory [1]_ |
+----------------------+---------------------------------------------+
| ``ctrl-shift-up``    | scroll up a line                            |
+----------------------+---------------------------------------------+
| ``ctrl-shift-down``  | scroll down a line                          |
+----------------------+---------------------------------------------+
| ``shift-pageup``     | scroll up a page                            |
+----------------------+---------------------------------------------+
| ``shift-pagedown``   | scroll down a page                          |
+----------------------+---------------------------------------------+
| ``ctrl-shift-l``     | reset and clear                             |
+----------------------+---------------------------------------------+
| ``ctrl-+``           | increase font size                          |
+----------------------+---------------------------------------------+
| ``ctrl--``           | decrease font size                          |
+----------------------+---------------------------------------------+
| ``ctrl-=``           | reset font size to default                  |
+----------------------+---------------------------------------------+

.. [1] The directory can be set by a process running in the terminal. For
       example:

       .. code:: sh

            if [[ ${VTE_VERSION:-0} -ge 3405 ]]; then
              . /etc/profile.d/vte.sh
              __vte_osc7
            fi


SELECTION MODE
--------------

+-----------------------------------+-----------------------------------------------------------+
| ``q`` or ``escape`` or ``ctrl-[`` | enter insert mode                                         |
+-----------------------------------+-----------------------------------------------------------+
| ``x``                             | activate url hints mode                                   |
+-----------------------------------+-----------------------------------------------------------+
| ``v``                             | visual mode                                               |
+-----------------------------------+-----------------------------------------------------------+
| ``V``                             | visual line mode                                          |
+-----------------------------------+-----------------------------------------------------------+
| ``ctrl-v``                        | visual block mode                                         |
+-----------------------------------+-----------------------------------------------------------+
| ``hjkl`` or arrow keys            | [count] move cursor left/down/up/right                    |
+-----------------------------------+-----------------------------------------------------------+
| ``w`` or ``shift-right``          | [count] forward word                                      |
+-----------------------------------+-----------------------------------------------------------+
| ``e``                             | [count] forward to end of word                            |
+-----------------------------------+-----------------------------------------------------------+
| ``b`` or ``shift-left``           | [count] backward word                                     |
+-----------------------------------+-----------------------------------------------------------+
| ``W`` or ``ctrl-right``           | [count] forward WORD (non-whitespace)                     |
+-----------------------------------+-----------------------------------------------------------+
| ``E``                             | [count] forward to end of WORD (non-whitespace)           |
+-----------------------------------+-----------------------------------------------------------+
| ``B`` or ``ctrl-left``            | [count] backward WORD (non-whitespace)                    |
+-----------------------------------+-----------------------------------------------------------+
| ``H``                             | jump to the top of the screen                             |
+-----------------------------------+-----------------------------------------------------------+
| ``M``                             | jump to the middle of the screen                          |
+-----------------------------------+-----------------------------------------------------------+
| ``L``                             | jump to the bottom of the screen                          |
+-----------------------------------+-----------------------------------------------------------+
| ``0`` or ``home``                 | move cursor to the first column in the row                |
+-----------------------------------+-----------------------------------------------------------+
| ``^``                             | beginning-of-line (first non-blank character)             |
+-----------------------------------+-----------------------------------------------------------+
| ``$`` or ``end``                  | end-of-line                                               |
+-----------------------------------+-----------------------------------------------------------+
| ``g``                             | jump to start of first row                                |
+-----------------------------------+-----------------------------------------------------------+
| ``G``                             | jump to start of last row                                 |
+-----------------------------------+-----------------------------------------------------------+
| ``ctrl-u``                        | [count] move cursor a half screen up                      |
+-----------------------------------+-----------------------------------------------------------+
| ``ctrl-d``                        | [count] move cursor a half screen down                    |
+-----------------------------------+-----------------------------------------------------------+
| ``ctrl-b``                        | [count] move cursor a full screen up (back)               |
+-----------------------------------+-----------------------------------------------------------+
| ``ctrl-f``                        | [count] move cursor a full screen down (forward)          |
+-----------------------------------+-----------------------------------------------------------+
| ``y``                             | copy to CLIPBOARD                                         |
+-----------------------------------+-----------------------------------------------------------+
| ``/``                             | forward search                                            |
+-----------------------------------+-----------------------------------------------------------+
| ``?``                             | reverse search                                            |
+-----------------------------------+-----------------------------------------------------------+
| ``u``                             | [count] forward url search                                |
+-----------------------------------+-----------------------------------------------------------+
| ``U``                             | [count] reverse url search                                |
+-----------------------------------+-----------------------------------------------------------+
| ``o``                             | open the current selection as a url                       |
+-----------------------------------+-----------------------------------------------------------+
| ``Return``                        | open the current selection as a url and enter insert mode |
+-----------------------------------+-----------------------------------------------------------+
| ``n``                             | [count] next search match                                 |
+-----------------------------------+-----------------------------------------------------------+
| ``N``                             | [count] previous search match                             |
+-----------------------------------+-----------------------------------------------------------+
| ``ctrl-+``                        | increase font size                                        |
+-----------------------------------+-----------------------------------------------------------+
| ``ctrl--``                        | decrease font size                                        |
+-----------------------------------+-----------------------------------------------------------+
| ``ctrl-=``                        | reset font size to default                                |
+-----------------------------------+-----------------------------------------------------------+

During scrollback search, the current selection is changed to the search match
and copied to the PRIMARY clipboard buffer.

With the text input widget focused, up/down (or tab/shift-tab) cycle through
completions, escape closes the widget and enter accepts the input.

In hints mode, the input will be accepted as soon as termite considers it a
unique match.

PADDING
=======

Internal padding can be added by using CSS to style Termite. Adding
the following snippet to ``$XDG_CONFIG_HOME/gtk-3.0/gtk.css`` (or
``~/.config/gtk-3.0/gtk.css``) will add uniform 2px padding around the edges:

.. code:: css

    .termite {
        padding: 2px;
    }

This can also be used to add varying amounts of padding to each side via
standard usage of the CSS padding property.

TERMINFO
========

Termite v15.1 and newer do *not* use a custom terminfo anymore; the built-in
VTE behaviour of using ``xterm-256color`` is kept. When working on a remote
system with this terminfo entry missing, an error might
occur:

::

    Error opening terminal: xterm-256color

To solve this issue, install the package that provides terminfo entries on
your remote system. Typically those are shipped as part of the ``ncurses``
package.

For example, on Arch Linux:

::

        pacman -S ncurses

