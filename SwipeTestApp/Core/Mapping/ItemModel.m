//
//  ItemModel.m
//  SwipeTestApp
//
//  Created by Artur Mirrov on 04.07.16.
//  Copyright © 2016 Artur Mirrov. All rights reserved.
//

#import "ItemModel.h"
#import "DetailItemModel.h" 

@implementation ItemModel

+ (EKObjectMapping *)objectMapping
{
    return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping *mapping)
            {
                [mapping hasMany:[DetailItemModel class] forKeyPath:@"items"];
            }];
}


@end
