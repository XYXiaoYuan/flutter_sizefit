#import "FlutterSizefitPlugin.h"
#if __has_include(<flutter_sizefit/flutter_sizefit-Swift.h>)
#import <flutter_sizefit/flutter_sizefit-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_sizefit-Swift.h"
#endif

@implementation FlutterSizefitPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterSizefitPlugin registerWithRegistrar:registrar];
}
@end
