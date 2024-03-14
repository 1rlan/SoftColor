
Pod::Spec.new do |s|
  s.name             = 'SoftColor'
  s.version          = '1.0.0'
  s.summary          = 'Add short description to explain your library'
  s.description      = <<-DESC
  Add long description to explain your library
                       DESC

  s.homepage         = 'https://github.com/ferhanakkan/AppCircleSampleProject'
  s.screenshots      = 'Add Your Library Image Link'
  s.license          = { :type => 'MIT', :file => 'LICENSE.txt' }
  s.author           = { 'SoftColor' => 'irlanidzzze@gmail.com' }
  s.source           = { :git => 'https://github.com/1rlan/SoftColor.git' }

  s.ios.deployment_target = '15.0'
  s.swift_version = '5.0'
  s.source_files = 'Sources/SoftColor/**/*'
end

