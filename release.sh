#!/bin/bash
set -e

# Usage
# PUBLISH_GEM=true GENERATE_LIB=true RELEASE_VERSION=1.3.1 ./release.sh

if [[ -z "$RELEASE_VERSION" ]]; then echo "forgot to set a release version e.g. RELEASE_VERSION=x.y.z - latest version: lib/phraseapp-ruby/version.rb"; exit 1; fi

PHRASE_RUBY_REPO=git@github.com:phrase/phraseapp-ruby.git
PHRASE_RUBY_TMP=$(mktemp -d /tmp/phraseapp-ruby-lib-XXXX)

if [[ -z "$PHRASE_RUBY_TMP" ]]; then echo "unable to create tmp dir"; exit 1; fi

trap "rm -Rf $PHRASE_RUBY_TMP" EXIT


# Release
git clone $PHRASE_RUBY_REPO $PHRASE_RUBY_TMP

pushd $PHRASE_RUBY_TMP > /dev/null

git checkout -b $RELEASE_VERSION

# only generates if pa-client-gen installed and explicitly set
if [[ "$GENERATE_LIB" == "true" ]]; then
  pa-client-gen generate ruby lib
fi

# bump version in lib/phraseapp-ruby/version.rb
cat > lib/phraseapp-ruby/version.rb <<EOF
module PhraseApp
  VERSION = '${RELEASE_VERSION}'
end
EOF

rake test

yard doc

# push version bump and documentation to orign/$RELEASE_VERSION
git add . && git commit -m "version bump: $RELEASE_VERSION" && git push origin $RELEASE_VERSION

# only publish gem if explicitly set
if [[ "$PUBLISH_GEM" == "true" ]]; then
  gem build phraseapp-ruby.gemspec
  gem push phraseapp-ruby-$RELEASE_VERSION.gem
fi

popd > /dev/null
