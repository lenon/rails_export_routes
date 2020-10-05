#!/usr/bin/env bash
set -euo pipefail

# update rubygems to fix a bug that causes bin/rake to fail
gem update --system

echo 'Building gem...'
bin/rake build

echo 'Listing content for debugging...'
tar --extract --to-stdout --file pkg/rails_export_routes-*.gem data.tar.gz \
  | tar --gunzip --list --verbose

echo 'Pushing to RubyGems.org...'
gem push pkg/rails_export_routes-*.gem
