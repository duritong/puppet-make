# modules/make/manifests/init.pp - manage make stuff
# Copyright (C) 2007 admin@immerda.ch
# GPLv3

class make {
  case $::operatingsystem {
    gentoo: { include make::gentoo }
    default: { include make::base }
  }
}
