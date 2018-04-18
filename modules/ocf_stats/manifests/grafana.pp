# grafana config
class ocf_stats::grafana {
  class { 'ocf::packages::grafana::apt':
    stage => first,
  }

  class { 'grafana':
    manage_package_repo => false,

    cfg                 => {
      app_mode     => 'production',
      server       => {
        http_addr => '127.0.0.1',
        http_port => 8990,

        domain    => 'leprosy.ocf.berkeley.edu',
        root_url  => 'https://leprosy.ocf.berkeley.edu/grafana/',
      },
      database     => {
        type => 'sqlite3',
        path => 'grafana.db',
      },
      users        => {
        auto_assign_org      => true,
        allow_sign_up        => false,
        auto_assign_org_role => 'Editor',
      },
      'auth'       => {
        disable_login_form   => true,
        disable_signout_menu => true,
      },
      'auth.proxy' => {
        enabled         => true,
        header_name     => 'X-WEBAUTH-USER',
        header_property => 'username',
        auto_sign_up    => true,
      },
      'auth.basic' => {
        enabled => false,
      },
      security     => {
        disable_gravatar => true,
      },
    },
  }
}
