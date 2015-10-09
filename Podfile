def common_pods
  # Ignore all warnings from pods.
  inhibit_all_warnings!

  pod 'MagicalRecord', '~> 2.3'
end

target 'Preloaded Database' do
  platform :ios, '8.0'

  common_pods
end

target 'Importer' do
  platform :osx, '10.10'

  common_pods
end
