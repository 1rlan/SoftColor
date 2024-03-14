
Pod::Spec.new do |s|
  s.name             = 'SoftColor'
  s.version          = '1.0.0'
  s.summary          = 'UI library'

  s.homepage         = 'https://github.com/ferhanakkan/AppCircleSampleProject'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '1rlan' => 'irlanidzzze@gmail.com' }
  s.source           = { :git => 'https://github.com/1rlan/SoftColor.git', :tag => s.version.to_s }

  s.ios.deployment_target = '15.0'
  s.swift_version = '5.0'
  s.source_files = 'Sources/SoftColor/**/*'
end

