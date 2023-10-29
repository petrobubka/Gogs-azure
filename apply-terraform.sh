#!/bin/bash

set -eu


cd terraform

terraform init

terraform apply -auto-approve

cd ..
