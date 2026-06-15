#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
# dnf5 install -y tmux

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

# systemctl enable podman.socket



# Install the akmod-wl driver, copied in the Containerfile
echo "Installing Broadcom wl wireless drivers..."

echo "Active kernel is:"
rpm -q kernel-core

echo "Driver files include:"
find /opt/akmods-rpms -type f | sort


dnf5 install -y \
    /opt/akmods-rpms/common/broadcom-wl-*.rpm \
    /opt/akmods-rpms/common/kmod-wl-*.rpm

# Cleanup rpms
rm -rf /opt/akmods-rpms
