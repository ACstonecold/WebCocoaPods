Pod::Spec.new do |s|
  
  s.name         = "WebCocoapods"
  s.version      = "0.1.1"
  s.summary      = "WebCocoapods version 1.0."
  s.description  = <<-DESC
                        First self cocoapods version, on 20161221.
                   DESC

  s.homepage     = "https://github.com/ACstonecold/WebCocoapods"
  s.license      = "MIT"
  s.author             = { "ACstonecold" => "tjrac.kobe@gmail.com" }
  s.platform     = :ios
  s.ios.deployment_target = "7.0"
  s.source       = { :git => "https://github.com/ACstonecold/WebCocoapods.git", :tag => "0.1.1" }
  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"
  s.framework  = "UIKit"
  s.requires_arc = true

end

