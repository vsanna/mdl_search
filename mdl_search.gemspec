# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mdl_search/version'

Gem::Specification.new do |spec|
  spec.name          = "mdl_search"
  spec.version       = MdlSearch::VERSION
  spec.authors       = ["Ryu Ishikawa"]
  spec.email         = ["cvcl0808@gmail.com"]
  spec.summary       = "gem to search material icons by icon-name, group, keywords" 
  spec.description   = "gem to search material icons by icon-name, group, keywords" 
  spec.homepage      = "https://github.com/vsanna/mdl_search"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin" # ここを替えないと実行ファイルの置き場として認識されない
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'thor'
  spec.add_dependency 'json'

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-byebug"
end
