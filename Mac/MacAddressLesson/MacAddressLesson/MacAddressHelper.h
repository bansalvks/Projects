//
//  IpAddress.h
//  Lesson 42
//
//  Created by Vikas Bansal (bansal.vks@gmail.com) on 21/07/15.
//
//

#import <Foundation/Foundation.h>

@interface MacAddressHelper : NSObject

+ (NSString *)address;
+ (NSString *)addressWithDelimiter:(NSString *)delimiter;

@end


#ifdef __IPHONE_OS_VERSION_MAX_ALLOWED

@interface UIDevice (MACAddress)

- (NSString *)MACAddress;

@end

#endif

