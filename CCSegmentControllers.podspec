Pod::Spec.new do |spec|

  spec.name         = "CCSegmentControllers"

  spec.version      = "1.0.2"

  spec.summary      = "Lazy init scrollable controllers quickly"

  spec.homepage     = "https://github.com/keisme/CCSegmentControllers"

  spec.license      = "MIT"

  spec.author       = { "JFF147" => "keisme3.0@gmail.com" }

  spec.platform     = :ios, "12.0"

  spec.swift_version = "5.0"

  spec.source       = { :git => "https://github.com/keisme/CCSegmentControllers.git", :tag => "#{spec.version}" }

  spec.source_files  = "Sources/*.{swift}"

end
