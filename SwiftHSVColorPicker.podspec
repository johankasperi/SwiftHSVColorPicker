Pod::Spec.new do |s|
	s.name         = 'SwiftHSVColorPicker'
	s.version      = '1.1.3'
	s.summary      = 'Swift HSV Color Picker'
	s.description  = 'A HSV Color Picker for iOS including a color wheel, brightness slider and a view for the selected color.'
	s.homepage     = 'https://github.com/johankasperi/SwiftHSVColorPicker'
  	s.license      = 'MIT'
	s.author       = { 'Johan Kasperi' => 'johan@kasperi.se' }
	s.social_media_url = 'https://twitter.com/johankasperi'
	s.platform     = :ios, '8.0'
	s.source       = { :git => 'https://github.com/johankasperi/SwiftHSVColorPicker.git', :tag => s.version.to_s }
	s.source_files = 'Classes', 'Source/**/*.{swift}'
	s.requires_arc = true
end
