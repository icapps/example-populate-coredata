// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Glider.h instead.

#import <CoreData/CoreData.h>

extern const struct GliderAttributes {
	__unsafe_unretained NSString *immatriculation;
	__unsafe_unretained NSString *name;
} GliderAttributes;

@interface GliderID : NSManagedObjectID {}
@end

@interface _Glider : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) GliderID* objectID;

@property (nonatomic, strong) NSString* immatriculation;

//- (BOOL)validateImmatriculation:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@end

@interface _Glider (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveImmatriculation;
- (void)setPrimitiveImmatriculation:(NSString*)value;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

@end
