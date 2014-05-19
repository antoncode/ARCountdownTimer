Pod::Spec.new do |s|
  s.name         = "ARCountdownTimer"
  s.version      = "0.0.1"
  s.summary      = "Simple Countdown Timer"
  s.description  = <<-DESC
                   Simple Countdown Timer using NSDateComponents and NSTimer.
                   DESC
  s.homepage     = "https://github.com/antoncode/ARCountdownTimer"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author             = { "Anton Rivera" => "anton.rivera@gmail.com" }
  s.platform     = :ios, '7.0'
  s.source       = { :git => "https://github.com/antoncode/ARCountdownTimer.git", :tag => "0.0.1" }
  s.source_files  = 'Classes', 'Classes/**/*.{h,m}'
  s.requires_arc = true
end
