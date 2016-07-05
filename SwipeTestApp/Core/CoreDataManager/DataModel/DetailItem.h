//
//  DetailItem.h
//  SwipeTestApp
//
//  Created by Artur Mirrov on 04.07.16.
//  Copyright © 2016 Artur Mirrov. All rights reserved.
//

@import Foundation;
@import CoreData;
#import "ModelObject.h"
@class DetailItemModel;

NS_ASSUME_NONNULL_BEGIN

@interface DetailItem : ModelObject

// Insert code here to declare functionality of your managed object subclass
- (void)loadDataFromItem:(DetailItemModel *)dictionary;
+ (DetailItem *)findOrCreateItemWithIdentifier:(NSString *)identifier inContext:(NSManagedObjectContext *)context;

@end

NS_ASSUME_NONNULL_END

#import "DetailItem+CoreDataProperties.h"
