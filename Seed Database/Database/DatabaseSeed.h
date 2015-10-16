//
//  DatabaseSeed.h
//  Preloaded Database
//
//  Created by Jelle Vandebeeck on 16/10/15.
//  Copyright © 2015 iCapps. All rights reserved.
//

@interface DatabaseSeed : NSObject

- (void)save:(void(^)(NSManagedObjectContext *localContext))block;
- (void)clean;

@end
