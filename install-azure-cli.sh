#!/bin/bash

set -eu

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

sudo dnf install -y https://packages.microsoft.com/config/rhel/9.0/packages-microsoft-prod.rpm

sudo dnf install azure-cli