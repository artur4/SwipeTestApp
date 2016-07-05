//
//  ModelObject.m
//  SwipeTestApp
//
//  Created by Artur Mirrov on 04.07.16.
//  Copyright © 2016 Artur Mirrov. All rights reserved.
//

#import "ModelObject.h"

@implementation ModelObject

+ (id)entityName {
    
    return NSStringFromClass(self);
}

+ (instancetype)insertNewObjectIntoContext:(NSManagedObjectContext*)context {
    
    return [NSEntityDescription insertNewObjectForEntityForName:[self entityName] inManagedObjectContext:context];
}

@end
