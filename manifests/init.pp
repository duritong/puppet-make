# modules/make/manifests/init.pp - manage make stuff
# Copyright (C) 2007 admin@immerda.ch
# GPLv3

# modules_dir { "make": }

class make {
    case $operatingsystem {
        gentoo: { include make::gentoo }
        default: { include make::base }
    }
}

class make::base {
    package{'make':
        ensure => installed,
    }
}

class make::gentoo inherits make::base {
    Package[make]{
        category => 'sys-devel',
    }

    #conf.d file if needed
    # needs module gentoo
    #gentoo::etcconfd { make: require => "Package[make]", notify => "Service[make]"}
}
