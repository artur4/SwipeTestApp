//
//  MapperBaseModel.m
//  SwipeTestApp
//
//  Created by Artur Mirrov on 04.07.16.
//  Copyright © 2016 Artur Mirrov. All rights reserved.
//

#import "MapperBaseModel.h"

@implementation MapperBaseModel

- (instancetype)initWithProperties:(NSDictionary *)properties
{
    self = [super init];
    if (self)
    {
        [EKMapper fillObject:self fromExternalRepresentation:properties withMapping:[[self class] objectMapping]];
    }
    return self;
}

+ (EKObjectMapping *)objectMapping
{
    //Do nothing. Implement in subclass if you want to initialize object
    //via object mapping
    NSAssert(nil, @"must be overriden");
    return nil;
}

@end
