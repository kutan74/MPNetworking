Pod::Spec.new do |s|
  s.name         = "MPNetworking"
  s.version      = "0.3.5"
  s.summary      = "Network abstraction layer written in Swift"
  s.description  = <<-EOS
  Allows to abstract your networking layer. MPNetworking doesn't use singleton patterns
  EOS
  s.homepage     = "https://github.com/kutan74/MPNetworking"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Kutan Çıngısız" => "cingisiz.akutan@gmail.com" }  
  s.platform = :ios, '10.0'
  s.source       = { :git => "https://github.com/kutan74/MPNetworking.git", :tag => s.version.to_s }
  s.swift_version = '5.0'  
  s.source_files  = "MPNetworking/Source/**/*"
  s.frameworks  = "Foundation"
  
end



