# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include profile_umask
class profile_umask (
  String $loginumask,
) {
  ##Change default user umask
  file_line { 'default_user_umask_profile':
    path               => '/etc/profile',
    line               => "    umask ${loginumask}",
    match              => '^\s*umask\s022$',
    append_on_no_match => 'false',
  }
  file_line{ 'default_user_umask_logins.def':
    path               => '/etc/profile',
    line               => "UMASK           ${loginumask}",
    match              => '^UMASK\s*022',
    append_on_no_match => 'false',
  }
}
