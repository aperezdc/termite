project('termite', 'c', 'cpp',
	version: '15.1',
	meson_version: '>=0.55.0',
	default_options: [
		'b_asneeded=true',
		'b_lundef=false',
		'gnu_symbol_visibility=hidden',

		# The following are all needed by the VTE subproject.
		'b_ndebug=false',
		'c_std=gnu11',
		'cpp_std=gnu++17',
		'cpp_eh=default',
		'cpp_rtti=true',
	],
)

add_project_arguments(
	'-DTERMITE_VERSION=' + meson.project_version().split('.')[0],
	'-D_POSIX_C_SOURCE=200809L',
	language: 'cpp',
)

tic_exe = find_program('tic', native: true)
tic_sh = find_program('tic.sh', native: true)

termite_tinfo = custom_target('terminfo',
	input: 'termite.terminfo',
	output: 'xterm-termite',
	command: [tic_sh, tic_exe.full_path(), '@PRIVATE_DIR@', '@INPUT@', '@OUTPUT@'],
	install: true,
	install_dir: get_option('datadir') / 'terminfo' / 'x',
)

vte_subproject = subproject('vte',
	default_options: [
		'default_library=static',
		'debugg=false',
		'docs=false',
		'gir=false',
		'glade=false',
		'gtk3=true',
		'gtk4=false',
		'vapi=false',
	],
)

executable('termite',
	'termite.cc',
	dependencies: vte_subproject.get_variable('libvte_gtk3_dep'),
	install: true,
)

install_data('config',
	install_dir: get_option('sysconfdir') / 'etc' / 'xdg' / 'termite',
)
install_data('termite.desktop',
	install_dir: get_option('datadir') / 'applications',
)
install_data('man' / 'termite.1',
	install_dir: get_option('mandir') / 'man1',
)
install_data('man' / 'termite.config.5',
	install_dir: get_option('mandir') / 'man5',
)
