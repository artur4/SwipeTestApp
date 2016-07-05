//
//  ModelObject.h
//  SwipeTestApp
//
//  Created by Artur Mirrov on 04.07.16.
//  Copyright © 2016 Artur Mirrov. All rights reserved.
//

@import Foundation;
@import CoreData;

@interface ModelObject : NSManagedObject

+ (id)entityName;
+ (instancetype)insertNewObjectIntoContext:(NSManagedObjectContext*)context;

@end
