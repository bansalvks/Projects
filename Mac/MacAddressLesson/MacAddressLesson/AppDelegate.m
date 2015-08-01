//
//  AppDelegate.m
//  MacAddressLesson
//
//  Created by Paxcel on 24/07/15.
//  Copyright © 2015 VikasBansal. All rights reserved.
//

#import "AppDelegate.h"
#import "MacAddressHelper.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

-(void)awakeFromNib{
    NSString* macAd = [MacAddressHelper address];
    NSLog(macAd);
}

@end
