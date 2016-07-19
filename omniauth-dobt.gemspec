require File.expand_path('../lib/omniauth-dobt/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Adam Becker']
  gem.email         = ['adam@dobt.co']
  gem.description   = %q{Internal OmniAuth strategy for the DOBT Platform.}
  gem.summary       = %q{Internal OmniAuth strategy for the DOBT Platform.}
  gem.homepage      = 'https://github.com/dobtco/omniauth-dobt'
  gem.license       = 'MIT'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-dobt"
  gem.require_paths = ['lib']
  gem.version       = OmniAuth::Dobt::VERSION

  gem.add_dependency 'omniauth', '~> 1.0'
  # Nothing lower than omniauth-oauth2 1.1.1
  # http://www.rubysec.com/advisories/CVE-2012-6134/
  gem.add_dependency 'omniauth-oauth2', '>= 1.1.1', '< 2.0'
end
