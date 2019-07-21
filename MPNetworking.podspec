Pod::Spec.new do |s|
  s.name         = "MPNetworking"
  s.version      = "0.0.4"
  s.summary      = "Network abstraction layer written in Swift"
  s.description  = <<-EOS
  Allows to abstract your networking layer. MPNetworking doesn't use singleton patterns
  EOS
  s.homepage     = "https://github.com/kutan74/MPNetworking"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Kutan Çıngısız" => "cingisiz.akutan@gmail.com" }
  s.social_media_url   = "https://twitter.com/kutancingisiz"
  s.platform = :ios, '10.0'
  s.source       = { :git => "https://github.com/kutan74/MPNetworking.git", :tag => s.version }
  s.swift_version = '4.2'  
  s.default_subspec = "Source"

  s.subspec "Source" do |ss|
    ss.source_files  = "Source/", "Extensions/"    
    ss.framework  = "Foundation"
  end
  
end



