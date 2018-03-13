class ocf_staffvm {
  class { '::prometheus':
    version        => '2.0.0',
    alerts => {},
    scrape_configs => [
      { 'job_name' => 'prometheus',
      'scrape_interval' => '10s',
      'scrape_timeout'  => '10s',
      'static_configs'  => [
        { 'targets' => [ 'localhost:9090' ],
        'labels'  => { 'alias' => 'Prometheus'}
        }
      ]
      }
    ]
  }

  include prometheus::node_exporter
}
