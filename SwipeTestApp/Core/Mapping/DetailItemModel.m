//
//  DetailItemModel.m
//  SwipeTestApp
//
//  Created by Artur Mirrov on 04.07.16.
//  Copyright © 2016 Artur Mirrov. All rights reserved.
//

#import "DetailItemModel.h"

@implementation DetailItemModel

+ (EKObjectMapping *)objectMapping
{
    return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping *mapping)
            {
                [mapping mapPropertiesFromDictionary:@{@"title" : @"title",
                                                       @"cover" : @"cover",
                                                       @"desc" : @"desc",
                                                       @"id" : @"id_item",
                                                       @"offers" : @"offers",
                                                       @"shops" : @"shops",
                                                       @"hide" : @"hide"}];
            }];
}

@end
