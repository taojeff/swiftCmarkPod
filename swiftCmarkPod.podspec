Pod::Spec.new do |s|
  s.name             = 'swiftCmarkPod'
  s.version          = '0.29.1'
  s.summary          = 'cmark-gfm for Swift'
  s.homepage         = 'https://github.com/taojeff/swiftCmarkPod'
  s.license          = { :type => 'BSD-2-Clause', :file => 'COPYING' }
  s.author           = { 'GIKICoder' => 'giki.biu@gmail.com' }
  s.source           = { :git => 'https://github.com/taojeff/swiftCmarkPod.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12.0'
  s.module_name = 'swiftCmarkPod'

  s.default_subspecs = 'cmark_gfm', 'cmark_gfm_extensions'

  s.subspec 'cmark_gfm' do |ss|
    ss.source_files = 'src/**/*.{h,c}'
    ss.public_header_files = 'src/include/*.h'
    ss.preserve_paths = 'src/include/module.modulemap'

    # ✅ 这两行是你真正缺少的
    ss.pod_target_xcconfig = {
      'DEFINES_MODULE' => 'YES',
      'CLANG_ENABLE_MODULES' => 'YES',
      'HEADER_SEARCH_PATHS' => '$(PODS_TARGET_SRCROOT)/src/include'
    }
  end

  s.subspec 'cmark_gfm_extensions' do |ss|
    ss.dependency 'swiftCmarkPod/cmark_gfm'
    ss.source_files = 'extensions/**/*.{h,c}'
    ss.public_header_files = 'extensions/include/*.h'

    ss.pod_target_xcconfig = {
      'DEFINES_MODULE' => 'YES',
      'CLANG_ENABLE_MODULES' => 'YES',
      'HEADER_SEARCH_PATHS' => '$(PODS_TARGET_SRCROOT)/extensions/include'
    }
  end
end