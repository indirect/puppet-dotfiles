define linked_dotfile($file = $title, $source) {

  file { "/Users/$boxen_user/.$file":
    ensure => 'link',
    target => "$source/$file"
  }
}

define dotfiles($repo = $title) {
  $dotfiles_dir = "${boxen::config::srcdir}/$repo"
  repository { $dotfiles_dir: source => $repo }

  $dotfile_names = files_in($dotfiles_dir)
  linked_dotfile { $dotfile_names:
    source => $dotfiles_dir,
    require => Repository[$dotfiles_dir]
  }
}
