//
//  DatabaseSeed.m
//  Preloaded Database
//
//  Created by Jelle Vandebeeck on 16/10/15.
//  Copyright © 2015 iCapps. All rights reserved.
//

#import <MagicalRecord/MagicalRecord.h>

#import "DatabaseSeed.h"

#import "MagicalRecord+WAL.h"

@implementation DatabaseSeed

- (instancetype)init {
    if (self = [super init]) {
        [self prepare];
    }
    return self;
}

- (void)prepare {
    NSString *projectRoot = [[[NSProcessInfo processInfo] environment] objectForKey:@"PROJECT_ROOT"];
    NSLog(@"💊 Locating Xcode project ar %@.", projectRoot);
    
    // Prepare database.
    NSLog(@"💊 Importing database started.");
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSString *path = [projectRoot stringByAppendingPathComponent:@"Glider Application/Database/Seed.sqlite"];
    // Removing file if needed.
    if ([fileManager fileExistsAtPath:path]) {
        if ([fileManager removeItemAtPath:path error:nil]) {
            NSLog(@"💊 Removed the preloaded database file.");
        }
    }
    
    // Setup MagicalRecord.
    NSLog(@"💊 Setup database started.");
    [MagicalRecord setLoggingLevel:MagicalRecordLoggingLevelOff];
    [MagicalRecord setupNonWALJournalledStackAtURL:[NSURL fileURLWithPath:path]];
}

- (void)save:(void(^)(NSManagedObjectContext *localContext))block {
    [MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext *localContext) {
        block(localContext);
    }];
}

- (void)clean {
    [MagicalRecord cleanUp];
    NSLog(@"💊 Importing database ended.");
}

@end
