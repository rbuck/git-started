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

KERNEL_TYPE=`uname -s`
case "$KERNEL_TYPE" in
  Linux*)
    KERNEL_TYPE=Linux
    VENDOR_TYPE=`lsb_release -i | sed 's/^.*:\s*//'`
    case "$VENDOR_TYPE" in
      Ubuntu*)
        VENDOR_TYPE=Debian
        ;;
      CentOS* | RedHat*)
        VENDOR_TYPE=RedHat
        ;;
      *)
        echo "Unsupported vendor type $VENDOR_TYPE. Exiting."
        exit 2
        ;;
    esac
    ;;
  Darwin*)
    KERNEL_TYPE=Darwin
    VENDOR_TYPE=Darwin
    ;;
  *)
    echo "Unsupported operating system type $KERNEL_TYPE. Exiting."
    exit 2
    ;;
esac

