//
//  IpAddress.c
//  Lesson 42
//
//  Created by Vikas Bansal (bansal.vks@gmail.com) on 21/07/15.
//
//

#include "MacAddressHelper.h"
#include <sys/socket.h>
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>



@implementation MacAddressHelper

+ (NSString *)address
{
    static NSString *macAddress = nil;
    if (macAddress == nil)
    {
        //set up managment information base
        int mib[] =
        {
            CTL_NET,
            AF_ROUTE,
            0,
            AF_LINK,
            NET_RT_IFLIST,
            if_nametoindex("en0")
        };
        
        //get message size
        size_t length = 0;
        if (mib[5] == 0 || sysctl(mib, 6, NULL, &length, NULL, 0) < 0 || length == 0)
        {
            return nil;
        }
        
        //get message
        NSMutableData *data = [NSMutableData dataWithLength:length];
        if (sysctl(mib, 6, [data mutableBytes], &length, NULL, 0) < 0)
        {
            return nil;
        }
        
        //get socket address
        struct sockaddr_dl *socketAddress = ([data mutableBytes] + sizeof(struct if_msghdr));
        unsigned char *coreAddress = (unsigned char *)LLADDR(socketAddress);
        macAddress = [[NSString alloc] initWithFormat:@"%02X:%02X:%02X:%02X:%02X:%02X",
                      coreAddress[0], coreAddress[1], coreAddress[2],
                      coreAddress[3], coreAddress[4], coreAddress[5]];
    }
    return macAddress;
}

+ (NSString *)addressWithDelimiter:(NSString *)delimiter
{
    return [[self address] stringByReplacingOccurrencesOfString:@":" withString:delimiter ?: @""];
}

@end


#ifdef __IPHONE_OS_VERSION_MAX_ALLOWED

@implementation UIDevice (MACAddress)

- (NSString *)MACAddress
{
    return [MACAddress address];
}

@end

#endif