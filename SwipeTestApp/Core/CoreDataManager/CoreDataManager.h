//
//  CoreDataManager.h
//  SwipeTestApp
//
//  Created by Artur Mirrov on 04.07.16.
//  Copyright © 2016 Artur Mirrov. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreData;

@interface CoreDataManager : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (readonly, strong, nonatomic) NSManagedObjectContext *backgroundManagedObjectContext;

@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;

- (void)saveBackgroundContext;

@end
