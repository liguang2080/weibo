# -*- encoding: utf-8 -*-
require File.expand_path('../lib/weibo/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["liguang"]
  gem.email         = ["lg2046@gmail.com"]
  gem.description   = %q{新浪微博oauth2}
  gem.summary       = %q{新浪微博oauth2}
  gem.homepage      = "https://github.com/lg2046/weibo"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "weibo"
  gem.require_paths = ["lib"]
  
  gem.add_dependency 'rest-client'
  
  gem.version       = Weibo::VERSION
end
