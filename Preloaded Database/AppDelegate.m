//
//  AppDelegate.m
//  Preloaded Database
//
//  Created by Jelle Vandenbeeck on 09/10/15.
//  Copyright © 2015 iCapps. All rights reserved.
//

#import <MagicalRecord/MagicalRecord.h>

#import "AppDelegate.h"

static const NSUInteger kCurrentSeedVersion = 1;

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Define the database storeURL.
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSURL *documentsURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSURL *storeURL = [documentsURL URLByAppendingPathComponent:@"Store.sqlite"];
    
    // Copy seed database if SeedVersion isn't the current version.
    NSUInteger seedVersion = [[NSUserDefaults standardUserDefaults] integerForKey:@"CurrentSeedVersion"];
    if (seedVersion < kCurrentSeedVersion) {
        NSLog(@"🚀 New seed version available.");
        
        // Copy the seed database
        NSURL *seededStoreURL = [[NSBundle mainBundle] URLForResource:@"Seed" withExtension:@"sqlite"];
        NSError *error = nil;
        
        // Remove the current database if available.
        if ([fileManager fileExistsAtPath:[storeURL path]]) {
            NSLog(@"🚀 Remove the current database.");
            [fileManager removeItemAtURL:storeURL error:nil];
        }
        
        if ([fileManager copyItemAtURL:seededStoreURL toURL:storeURL error:&error]) {
            NSLog(@"🚀 Move the seed database to the store location.");
            [[NSUserDefaults standardUserDefaults] setInteger:kCurrentSeedVersion forKey:@"CurrentSeedVersion"];
        } else {
            NSLog(@"Error: Unable to copy seeded database. %@", [error localizedDescription]);
        }
    }

    // Prepare database.
    [MagicalRecord setupCoreDataStackWithAutoMigratingSqliteStoreAtURL:storeURL];
    
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [MagicalRecord cleanUp];
}

@end
