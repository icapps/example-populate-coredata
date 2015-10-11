//
//  AppDelegate.m
//  Preloaded Database
//
//  Created by Jelle Vandenbeeck on 09/10/15.
//  Copyright © 2015 iCapps. All rights reserved.
//

#import <MagicalRecord/MagicalRecord.h>

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Copy preseed.
    NSURL *seededStoreURL = [[NSBundle mainBundle] URLForResource:@"Seed" withExtension:@"sqlite"];
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSURL *documentsURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSURL *storeURL = [documentsURL URLByAppendingPathComponent:@"Store.sqlite"];
    NSError *error = nil;
    if (![fileManager copyItemAtURL:seededStoreURL toURL:storeURL error:&error]) {
        NSLog(@"Error: Unable to copy seeded database.");
    }

    // Prepare database.
    [MagicalRecord setupCoreDataStackWithAutoMigratingSqliteStoreAtURL:storeURL];
    
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [MagicalRecord cleanUp];
}

@end
