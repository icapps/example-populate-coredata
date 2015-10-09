//
//  main.m
//  Importer
//
//  Created by Jelle Vandenbeeck on 09/10/15.
//  Copyright © 2015 iCapps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MagicalRecord/MagicalRecord.h>

#import "Glider.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"🚀 Importing database started.");
        
        // Prepare database.
        NSFileManager* fileManager = [NSFileManager defaultManager];
        NSString *path = [@"~/Desktop/preloaded.sqlite" stringByExpandingTildeInPath];

        // Removing file if needed.
        if ([fileManager fileExistsAtPath:path]) {
            if ([fileManager removeItemAtPath:path error:nil]) {
                NSLog(@"🚀 Removed the preloaded database file.");
            }
        }
        
        // Setup MagicalRecord.
        [MagicalRecord setLoggingLevel:MagicalRecordLoggingLevelOff];
        [MagicalRecord setupCoreDataStackWithAutoMigratingSqliteStoreAtURL:[NSURL fileURLWithPath:path]];
        
        // Import gliders.
        [MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext *localContext) {
            NSLog(@"✈️ Importing glider OO-YBR.");
            Glider *ventus = [Glider MR_createEntityInContext:localContext];
            ventus.immatriculation = @"OO-YBR";
            ventus.name = @"Schempp-Hirth Ventus cT";
            
            NSLog(@"✈️ Importing glider OO-YEI.");
            Glider *ls = [Glider MR_createEntityInContext:localContext];
            ls.immatriculation = @"OO-YEI";
            ls.name = @"Rolladen-Schneider LS7";
            
            NSLog(@"✈️ Importing glider OO-YMR.");
            Glider *discus = [Glider MR_createEntityInContext:localContext];
            discus.immatriculation = @"OO-YMR";
            discus.name = @"Schempp-Hirth Discus 2b";
        }];
        
        NSLog(@"🚀 Importing database ended.");
    }
    return 0;
}
