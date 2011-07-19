#!/bin/sh

# Script prolog to determine the hardware and os types.

MACHINE_TYPE=`uname -m`
case "$MACHINE_TYPE" in
  x86_64*)
    MACHINE_TYPE=x86_64
    ;;
  i[3-6]86*)
    MACHINE_TYPE=x86
    ;;
  *)
    echo "Unsupported machine type: $MACHINE_TYPE."
    exit 2
    ;;
esac

exists() {
    WHAT="$1"
    shift;
    [[ -f "$WHAT" ]] && return 0  || return 1
}

KERNEL_TYPE=`uname -s`
case "$KERNEL_TYPE" in
  Linux*)
    KERNEL_TYPE=Linux
    if exists "/etc/redhat-release" ; then DISTRO_TYPE=RedHat ; fi 
    if exists "/etc/debian_version" ; then DISTRO_TYPE=Debian ; fi 
    case "$DISTRO_TYPE" in
      Ubuntu* | Debian*)
        ;;
      CentOS* | RedHat*)
        ;;
      *)
        echo "Unsupported vendor type $DISTRO_TYPE. Exiting."
        exit 2
        ;;
    esac
    ;;
  Darwin*)
    KERNEL_TYPE=Darwin
    DISTRO_TYPE=Darwin
    ;;
  *)
    echo "Unsupported operating system type $KERNEL_TYPE. Exiting."
    exit 2
    ;;
esac
