//
//  main.m
//  Importer
//
//  Created by Jelle Vandenbeeck on 09/10/15.
//  Copyright © 2015 iCapps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MagicalRecord/MagicalRecord.h>

#import "DatabaseSeed.h"

#import "Glider.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        DatabaseSeed *seed = [DatabaseSeed new];
        [seed save:^(NSManagedObjectContext *localContext) {
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
        [seed clean];
    }
    return 0;
}