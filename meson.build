project('termite', 'c', 'cpp',
	version: '16.9',
	meson_version: '>=0.61',
	default_options: [
		'b_asneeded=true',
		'b_lundef=false',
		'b_ndebug=if-release',

		# The following are all needed by the VTE subproject.
		'c_std=gnu11',
		'cpp_std=gnu++17',
		'cpp_eh=default',
		'cpp_rtti=true',
	],
)

add_project_arguments(
	'-DTERMITE_VERSION="v' + meson.project_version() + '"',
	'-D_POSIX_C_SOURCE=200809L',
	language: 'cpp',
)

vte_subproject = subproject('vte',
	default_options: [
		'default_library=static',
		'dbg=false',
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
	install_dir: get_option('sysconfdir') / 'xdg' / 'termite',
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
