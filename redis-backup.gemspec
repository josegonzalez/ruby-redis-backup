# -*- encoding: utf-8 -*-
require File.expand_path('../lib/redis-backup/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jose Diaz-Gonzalez"]
  gem.email         = ["email@josediazgonzalez.com"]
  gem.description   = %q{redis-backup is a simple backup script to automate the creation and storage or redis dump.rdb files.}
  gem.summary       = %q{a small ruby gem that allows automated redis-backups}
  gem.homepage      = "https://github.com/josegonzalez/redis-backup"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "redis-backup"
  gem.require_paths = ["lib"]
  gem.version       = RedisBackup::VERSION
  gem.add_dependency(%q<aws-sdk>, [">= 0"])
  gem.add_dependency(%q<redis>, [">= 0"])
  gem.add_dependency(%q<rubyzip>, [">= 0"])
end
