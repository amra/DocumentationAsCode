#!/bin/bash

USER_VALUE=$(cat /boot/config-$(uname -r) | grep CONFIG_USER_NS)
SECCOMP_VALUE=$(cat /boot/config-$(uname -r) | grep CONFIG_SECCOMP)

USER_NS_AVAILABLE="${USER_VALUE: -1}"
SECCOMP_AVAILABLE="${SECCOMP_VALUE: -1}"

if [[ "$USER_NS_AVAILABLE" != "y" ]]
then
  echo '----------'
  echo 'You do not have namespacing in the kernel. You will need to enable the SUID sandbox or upgrade your kernel.'
  echo 'See https://chromium.googlesource.com/chromium/src/+/master/docs/linux_suid_sandbox_development.md'
  echo '----------'
fi

if [[ "$SECCOMP_AVAILABLE" != "y" ]]
then
  echo '----------'
  echo 'Your kernel does not have Seccomp-BPF enabled.'
  echo 'You will either need to enable the kernel module'
  echo 'or run Chromium with "--disable-seccomp-filter-sandbox"'
  echo '----------'
fi
