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
  # 核心：不拆、不指定静态/动态
  # ==============================
  s.source_files = 'src/**/*.{h,c,inc}', 'extensions/**/*.{h,c,inc}'
  s.public_header_files = 'src/include/*.h', 'extensions/include/*.h'

  # ==============================
  # 🔴 绝杀配置1：USER_HEADER_SEARCH_PATHS
  # 🔴 绝杀配置2：SWIFT_INCLUDE_PATHS
  # 这两个是强制让 Clang 看到头文件！
  # ==============================
  s.user_target_xcconfig = {
    "HEADER_SEARCH_PATHS" => "$(PODS_TARGET_SRCROOT)/src/include $(PODS_TARGET_SRCROOT)/src $(PODS_TARGET_SRCROOT)/extensions/include",
    "USER_HEADER_SEARCH_PATHS" => "$(PODS_TARGET_SRCROOT)/src/include $(PODS_TARGET_SRCROOT)/src $(PODS_TARGET_SRCROOT)/extensions/include",
    "SWIFT_INCLUDE_PATHS" => "$(PODS_TARGET_SRCROOT)/src/include $(PODS_TARGET_SRCROOT)/extensions/include"
  }

  s.pod_target_xcconfig = {
    "DEFINES_MODULE" => "YES",
    "CLANG_ENABLE_MODULES" => "YES",
    "HEADER_SEARCH_PATHS" => "$(PODS_TARGET_SRCROOT)/src/include $(PODS_TARGET_SRCROOT)/src $(PODS_TARGET_SRCROOT)/extensions/include",
    "USER_HEADER_SEARCH_PATHS" => "$(PODS_TARGET_SRCROOT)/src/include $(PODS_TARGET_SRCROOT)/src $(PODS_TARGET_SRCROOT)/extensions/include",
    "GCC_PREPROCESSOR_DEFINITIONS" => "CMARK_GFM=1",
    "WARNING_CFLAGS" => "-Wno-strict-prototypes -Wno-incomplete-umbrella"
  }

  # ==============================
  # 🔴 绝杀配置3：requires_arc 关闭
  # C 语言文件必须关闭 ARC
  # ==============================
  s.requires_arc = false
end