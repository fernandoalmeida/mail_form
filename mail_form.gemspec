# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "mail_form"
  s.summary = "Receive a form post request and send to specified email."
  s.description = "Mail Form receive a hash of parameters sent by a POST request, validate them, and email them to a specidied email address."
  s.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.rdoc"]
  s.version = "0.0.1"
end
