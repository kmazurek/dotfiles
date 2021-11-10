#!/bin/bash
set -euo pipefail

$INSTALL_CMD obs-studio v4l2loopback-autoload obs-v4l2sink
sudo modprobe v4l2loopback
