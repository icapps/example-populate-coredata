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
    // Define the database storeURL.
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSURL *documentsURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSURL *storeURL = [documentsURL URLByAppendingPathComponent:@"Store.sqlite"];
    
    // Copy seed database if SeedVersion isn't the current version.
    NSDictionary *infoDictionary = [NSBundle mainBundle].infoDictionary;
    NSString* bundleVersion = [infoDictionary objectForKey:(NSString *)kCFBundleVersionKey];
    NSString *seedVersion = [[NSUserDefaults standardUserDefaults] objectForKey:@"SeedVersion"];
    if (![seedVersion isEqualToString:bundleVersion]) {
        // Copy the seed database
        NSURL *seededStoreURL = [[NSBundle mainBundle] URLForResource:@"Seed" withExtension:@"sqlite"];
        NSError *error = nil;
        if (![fileManager copyItemAtURL:seededStoreURL toURL:storeURL error:&error]) {
            NSLog(@"Error: Unable to copy seeded database.");
        }
    }
    [[NSUserDefaults standardUserDefaults] setObject:bundleVersion forKey:@"SeedVersion"];

    // Prepare database.
    [MagicalRecord setupCoreDataStackWithAutoMigratingSqliteStoreAtURL:storeURL];
    
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [MagicalRecord cleanUp];
}

@end
