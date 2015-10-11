//
//  MagicalRecord+WAL.h
//  Preloaded Database
//
//  Created by Jelle Vandenbeeck on 11/10/15.
//  Copyright © 2015 iCapps. All rights reserved.
//

#import <MagicalRecord/MagicalRecord.h>

@interface MagicalRecord (WAL)

+ (void)setupCoreDataStackWithAutoMigratingNonWALSqliteStoreAtURL:(NSURL *)storeURL;

@end
