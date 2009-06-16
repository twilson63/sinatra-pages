# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{sinatra-pages}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["twilson63"]
  s.date = %q{2009-06-15}
  s.email = %q{tom@jackrussellsoftware.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION.yml",
     "config/database.yml",
     "db/migrate/001_create_pages.rb",
     "lib/sinatra/pages.rb",
     "sinatra-pages.gemspec",
     "test/contest.rb",
     "test/helper.rb",
     "test/sinatra-pages_test.rb"
  ]
  s.homepage = %q{http://github.com/twilson63/sinatra-pages}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{A Sinatra Extension that allows you to use a rest controller to add dynamic pages to your app -- see the blank project.  http://github.com/twilson63/blank}
  s.test_files = [
    "test/helper.rb",
     "test/sinatra-pages_test.rb",
     "test/contest.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
