//
//  MagicalRecord+WAL.m
//  Preloaded Database
//
//  Created by Jelle Vandenbeeck on 11/10/15.
//  Copyright © 2015 iCapps. All rights reserved.
//

#import "MagicalRecord+WAL.h"

@implementation MagicalRecord (WAL)

+ (void)setupNonWALJournalledStackAtURL:(NSURL *)storeURL {
    NSManagedObjectModel *model = [NSManagedObjectModel MR_defaultManagedObjectModel];
    NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    
    NSDictionary *options = @{
                              NSMigratePersistentStoresAutomaticallyOption: @YES,
                              NSInferMappingModelAutomaticallyOption: @YES,
                              NSSQLitePragmasOption: @{ @"journal_mode" : @"DELETE" }
                              };
    
    NSError *error = nil;
    [coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:options error:&error];
    if (error) {
        NSLog(@"Error setting up store:%@ for %@", [error localizedDescription], storeURL);
        exit (-1);
    }
    
    [NSPersistentStoreCoordinator MR_setDefaultStoreCoordinator:coordinator];
    [NSManagedObjectContext MR_initializeDefaultContextWithCoordinator:coordinator];
}

@end
