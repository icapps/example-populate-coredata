//
//  MagicalRecord+Seed.h
//  Preloaded Database
//
//  Created by Jelle Vandebeeck on 16/10/15.
//  Copyright © 2015 iCapps. All rights reserved.
//

#import "MagicalRecordInternal.h"

@interface MagicalRecord (Seed)

+ (void)setupSeededStackWithName:(NSString *)storeName;

@end
