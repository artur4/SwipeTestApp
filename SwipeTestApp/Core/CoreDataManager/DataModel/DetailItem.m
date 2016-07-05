//
//  DetailItem.m
//  SwipeTestApp
//
//  Created by Artur Mirrov on 04.07.16.
//  Copyright © 2016 Artur Mirrov. All rights reserved.
//

#import "DetailItem.h"
#import "DetailItemModel.h"

@implementation DetailItem

// Insert code here to add functionality to your managed object subclass

- (void)loadDataFromItem:(DetailItemModel *)item {
    
    self.title = item.title;
    self.desc = item.desc;
    self.cover = item.cover;
}


+ (DetailItem *)findOrCreateItemWithIdentifier:(NSString *)identifier inContext:(NSManagedObjectContext *)context {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[self entityName]];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"id_item = %@", identifier];
    NSError *error = nil;
    NSArray *result = [context executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"error: %@", error.localizedDescription);
    }
    if (result.lastObject) {
        return result.lastObject;
    } else {
        DetailItem *item = [self insertNewObjectIntoContext:context];
        item.id_item = identifier;
        
        return item;
    }
}

@end
