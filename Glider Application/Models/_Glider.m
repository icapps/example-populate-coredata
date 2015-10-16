// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Glider.m instead.

#import "_Glider.h"

const struct GliderAttributes GliderAttributes = {
	.immatriculation = @"immatriculation",
	.name = @"name",
};

@implementation GliderID
@end

@implementation _Glider

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Glider" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Glider";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Glider" inManagedObjectContext:moc_];
}

- (GliderID*)objectID {
	return (GliderID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic immatriculation;

@dynamic name;

@end

