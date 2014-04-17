class demo1::quagga {
    service { 'quagga':
        ensure    => running,
        hasstatus => false,
        enable    => true,
    }

    file { '/etc/quagga/daemons':
        owner  => quagga,
        group  => quagga,
        source => 'puppet:///modules/demo1/quagga_daemons',
        notify => Service['quagga']
    }

    file { '/etc/quagga/Quagga.conf':
        owner   => root,
        group   => quaggavty,
        mode    => '0644',
        content => template('demo1/Quagga.conf.erb'),
        notify  => Service['quagga']
    }
}
