# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'phraseapp/version'

Gem::Specification.new do |gem|
  gem.name          = "phraseapp-ruby"
  gem.version       = PhraseApp::VERSION
  gem.authors       = ["PhraseApp"]
  gem.email         = ["info@phraseapp.com"]
  gem.description   = "PhraseApp API client libary"
  gem.summary       = "Interact with the PhraseApp API"
  gem.homepage      = "https://github.com/phrase/phraseapp-ruby"
  gem.files         = `git ls-files ./lib`.split($/)
  gem.license       = "BSD"
end
