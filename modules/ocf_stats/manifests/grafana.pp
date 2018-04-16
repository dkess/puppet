# grafana config
class ocf_stats::grafana {
  class { 'ocf::packages::grafana::apt':
    stage => first,
  }

  #package { 'grafana':; }

  class { 'grafana':
    manage_package_repo => false,

    cfg                 => {
      app_mode => 'production',
      server   => {
        http_addr => '127.0.0.1',
        http_port => 8990,

        root_url  => 'https://leprosy.ocf.berkeley.edu/grafana/',
      },
      database => {
        type => 'sqlite3',
        path => 'grafana.db',
      },
    },
  }
}
