#!/bin/bash
set -e

# Usage
# PUBLISH_GEM=true RELEASE_VERSION=1.2.7 ./release.sh

PHRASEAPP_RUBY_REPO=git@github.com:phrase/phraseapp-ruby.git
PHRASEAPP_RUBY_TMP=$(mktemp -d /tmp/phraseapp-ruby-lib-XXXX)


function cleanup {
  rm -Rf $PHRASEAPP_RUBY_TMP
}

function write_version {
cat <<EOF > lib/phraseapp-ruby/version.rb
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


trap "cleanup" EXIT

git clone $PHRASEAPP_RUBY_REPO $PHRASEAPP_RUBY_TMP

pushd $PHRASEAPP_RUBY_TMP > /dev/null

# test -e fails
rake test

current_version=$(cat lib/phraseapp-ruby/version.rb | grep VERSION | cut -d "=" -f 2 | xargs | tr -d '\r')
RELEASE_VERSION=${RELEASE_VERSION:-$current_version}

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
