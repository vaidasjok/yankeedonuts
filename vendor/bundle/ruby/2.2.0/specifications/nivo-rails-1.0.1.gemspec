# -*- encoding: utf-8 -*-
# stub: nivo-rails 1.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "nivo-rails".freeze
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Robin Dupret".freeze]
  s.date = "2017-05-16"
  s.description = "Nivo slider with Ruby on Rails".freeze
  s.email = ["robin.dupret@gmail.com".freeze]
  s.homepage = "https://github.com/robin850/nivo-rails".freeze
  s.rubygems_version = "2.6.12".freeze
  s.summary = "This gem allows you to use Nivo slider with Ruby on Rails".freeze

  s.installed_by_version = "2.6.12" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<actionview>.freeze, [">= 4.2.0"])
    else
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<actionview>.freeze, [">= 4.2.0"])
    end
  else
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<actionview>.freeze, [">= 4.2.0"])
  end
end
