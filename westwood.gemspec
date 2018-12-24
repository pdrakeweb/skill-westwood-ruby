Gem::Specification.new do |s|
  s.name         = 'westwood-skill'
  s.version      = '0.0.1'
  s.author       = 'Peter Drake'
  s.email        = 'pdrake@gmail.com'
  s.homepage     = 'http://www.westwoodcma.org'
  s.summary      = 'Westwood CMA Alexa Skill.'
  s.description  = 'Yeah, that. I guess.'
  s.files        = Dir['Gemfile*', 'Rakefile', '*.gemspec', '*.md', '*.raml',
                       '*.ru', '*.yml',
                       '{bin,config,db,doc,lib,schema,script}/**/*']
  s.require_path = 'lib'
  s.bindir       = 'bin'
  s.executables = Dir['bin/*'].map { |f| File.basename(f) }

  s.add_dependency('ralyxa')
  s.add_dependency('sinatra')
  s.add_dependency('bugsnag')
  s.add_dependency('bundler')
  s.add_dependency('chronic')
  s.add_dependency('chronic_duration')
  
  
  s.add_development_dependency('rerun')
end