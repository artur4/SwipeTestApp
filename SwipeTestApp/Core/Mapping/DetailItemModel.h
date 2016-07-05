//
//  DetailItemModel.h
//  SwipeTestApp
//
//  Created by Artur Mirrov on 04.07.16.
//  Copyright © 2016 Artur Mirrov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapperBaseModel.h"

@interface DetailItemModel : MapperBaseModel

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSURL *cover;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *id_item;
@property (nonatomic, strong) NSArray *offers;
@property (nonatomic, strong) NSArray *shops;
@property (nonatomic, assign) BOOL hide;

@end
