//
//  AppDelegate.m
//  Preloaded Database
//
//  Created by Jelle Vandenbeeck on 09/10/15.
//  Copyright © 2015 iCapps. All rights reserved.
//

#import <MagicalRecord/MagicalRecord.h>

#import "AppDelegate.h"

#import "MagicalRecord+Seed.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [MagicalRecord setupSeededStackWithName:@"Store.sqlite"];
    
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [MagicalRecord cleanUp];
}

@end
