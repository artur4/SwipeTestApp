//
//  ItemModel.h
//  SwipeTestApp
//
//  Created by Artur Mirrov on 04.07.16.
//  Copyright © 2016 Artur Mirrov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapperBaseModel.h"
@class DetailItemModel;

@interface ItemModel : MapperBaseModel

@property (nonatomic, strong) NSArray *items;

@end
