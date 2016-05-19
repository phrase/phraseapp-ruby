#!/bin/bash
set -e

# Usage
# PUBLISH_GEM=true RELEASE_VERSION=1.2.7 ./release.sh

PHRASE_RUBY_REPO=git@github.com:phrase/phraseapp-ruby.git
PHRASE_RUBY_TMP=$(mktemp -d /tmp/phraseapp-ruby-lib-XXXX)

trap "rm -Rf $PHRASE_RUBY_TMP" EXIT

if [[ -z "$PHRASE_RUBY_TMP" ]]; then echo "unable to create tmp dir"; exit 1; fi


function write_version {
cat > lib/phraseapp-ruby/version.rb <<EOF
module PhraseApp
  VERSION = '${1}'
end
EOF
}

function push_to_git {
  current_branch=$(git symbolic-ref --short HEAD)
  if [[ "$current_branch" != "$1" ]]; then
    git checkout -b $1
  fi

  git add .
  git commit -m "version bump: $1"
  git push origin $1
}


git clone $PHRASE_RUBY_REPO $PHRASE_RUBY_TMP

pushd $PHRASE_RUBY_TMP > /dev/null

# tese fails
rake test

if [[ -z "$RELEASE_VERSION" ]]; then
  current_version=$(cat lib/phraseapp-ruby/version.rb | grep VERSION | cut -d "=" -f 2 | xargs | tr -d '\r')
  if [[ -z  ${current_version// /}  ]]; then
    echo "unable to get version from lib/phraseapp-ruby/version.rb"; exit 1;
  fi
  RELEASE_VERSION=$current_version
fi

# bump version in lib/phraseapp-ruby/version.rb
write_version $RELEASE_VERSION

# generate documentation with yard
yard doc

# push version bump and documentation to orign/$RELEASE_VERSION
push_to_git $RELEASE_VERSION

# build Gem
gem build phraseapp-ruby.gemspec

# Publish gem on Ruby Gems
if [[ "$PUBLISH_GEM" == "true" ]]; then
  gem push phraseapp-ruby-$RELEASE_VERSION.gem
fi

popd > /dev/null
