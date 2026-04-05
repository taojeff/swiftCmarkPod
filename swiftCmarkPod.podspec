Pod::Spec.new do |s|
  s.name             = 'swiftCmarkPod'
  s.version          = '0.29.1.1'
  s.summary          = 'A CocoaPods wrapper for the cmark-gfm library.'
  s.description      = 'This pod provides the cmark-gfm library, including both the core parser and GFM extensions, for use in iOS, macOS, and other Apple platforms.'
  s.homepage         = 'https://github.com/taojeff/swiftCmarkPod'
  s.license          = { :type => 'BSD-2-Clause', :file => 'COPYING' }
  s.author           = { 'GIKICoder' => 'https://github.com/GIKICoder' }

  s.source           = { :path => "." }

  s.ios.deployment_target = '12.0'
  s.module_name = 'swiftCmarkPod'

  s.default_subspecs = 'cmark_gfm', 'cmark_gfm_extensions'

  # ==========================
  # 核心模块（已修复）
  # ==========================
  s.subspec 'cmark_gfm' do |ss|
    ss.source_files = 'src/**/*.{h,c,inc}'
    ss.preserve_paths = 'src/**/*'
    ss.public_header_files = 'src/include/*.h'

    ss.pod_target_xcconfig = {
      "DEFINES_MODULE" => "YES",
      "CLANG_ENABLE_MODULES" => "YES",
      "HEADER_SEARCH_PATHS" => "$(PODS_TARGET_SRCROOT)/src/include $(PODS_TARGET_SRCROOT)/src",
      "GCC_PREPROCESSOR_DEFINITIONS" => "CMARK_GFM=1"
    }
  end

  # ==========================
  # 扩展模块（这里才是关键！）
  # ==========================
  s.subspec 'cmark_gfm_extensions' do |ss|
    ss.dependency 'swiftCmarkPod/cmark_gfm'

    ss.source_files = 'extensions/**/*.{h,c,inc}'
    ss.preserve_paths = 'extensions/**/*'
    ss.public_header_files = 'extensions/include/*.h'

    # ✅ 这一行是你真正缺少的
    ss.pod_target_xcconfig = {
      "DEFINES_MODULE" => "YES",
      "CLANG_ENABLE_MODULES" => "YES",
      "HEADER_SEARCH_PATHS" => "$(PODS_TARGET_SRCROOT)/src/include $(PODS_TARGET_SRCROOT)/extensions/include"
    }
  end
end