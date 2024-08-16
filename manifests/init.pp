# @summary Modifies the default umask of 022
#
# @param loginumask
#   The umask that replaces the default 022 umask 
#
# @example
#   include profile_umask
class profile_umask (
  String $loginumask,
) {
  # BOTH RHEL & SUSE
  file_line { 'default_user_umask_logins.def':
    path               => '/etc/login.defs',
    line               => "UMASK           ${loginumask}",
    match              => '^UMASK\s*022',
    append_on_no_match => 'false',
  }

  # ONLY RHEL
  if ( $facts['os']['family'] == 'RedHat' ) {
    ##Change default user umask
    file_line { 'default_user_umask_profile':
      path               => '/etc/profile',
      line               => "    umask ${loginumask}",
      match              => '^\s*umask\s022$',
      append_on_no_match => 'false',
    }
    file_line { 'default_user_umask_csh.cshrc':
      path               => '/etc/csh.cshrc',
      line               => "    umask ${loginumask}",
      match              => '^\s*umask\s022$',
      append_on_no_match => 'false',
    }
  }

  # ONLY SUSE
  if ( $facts['os']['family'] == 'Suse') {
    file_line { 'default_user_umask_csh.login':
      path               => '/etc/csh.login',
      line               => "umask ${loginumask}",
      match              => '^umask\s022$',
      append_on_no_match => 'false',
    }
  }
}
