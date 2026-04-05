Pod::Spec.new do |s|
  s.name             = 'swiftCmarkPod'
  s.version          = '0.29.1.1'
  s.summary          = 'A CocoaPods wrapper for the cmark-gfm library.'
  s.description      = 'This pod provides the cmark-gfm library, including both the core parser and GFM extensions, for use in iOS, macOS, and other Apple platforms.'
  s.homepage         = 'https://github.com/taojeff/swiftCmarkPod'
  s.license          = { :type => 'BSD-2-Clause', :file => 'COPYING' }
  s.author           = { 'GIKICoder' => 'https://github.com/GIKICoder' }

  s.source           = { :git => 'https://github.com/taojeff/swiftCmarkPod.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12.0'
  s.module_name = 'swiftCmarkPod'

  # ==============================
  # 万能关键：不写 static_framework
  # 不拆 subspec
  # 全部源码合并编译
  # ==============================

  s.source_files = 'src/**/*.{h,c,inc}', 'extensions/**/*.{h,c,inc}'
  s.public_header_files = 'src/include/*.h', 'extensions/include/*.h'
  s.preserve_paths = 'src/**/*', 'extensions/**/*'

  s.pod_target_xcconfig = {
    "DEFINES_MODULE" => "YES",
    "CLANG_ENABLE_MODULES" => "YES",
    "HEADER_SEARCH_PATHS" => "$(PODS_TARGET_SRCROOT)/src/include $(PODS_TARGET_SRCROOT)/src $(PODS_TARGET_SRCROOT)/extensions/include",
    "GCC_PREPROCESSOR_DEFINITIONS" => "CMARK_GFM=1",
    "WARNING_CFLAGS" => "-Wno-strict-prototypes" # 屏蔽C语言旧语法警告
  }
end