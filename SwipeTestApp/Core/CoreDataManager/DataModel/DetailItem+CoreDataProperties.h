//
//  DetailItem+CoreDataProperties.h
//  SwipeTestApp
//
//  Created by Artur Mirrov on 04.07.16.
//  Copyright © 2016 Artur Mirrov. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "DetailItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailItem (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSString *desc;
@property (nullable, nonatomic, retain) id cover;
@property (nullable, nonatomic, retain) NSString *id_item;
@property (nullable, nonatomic, retain) id offers;
@property (nullable, nonatomic, retain) id shops;
@property (nullable, nonatomic, retain) NSNumber *hide;

@end

NS_ASSUME_NONNULL_END
