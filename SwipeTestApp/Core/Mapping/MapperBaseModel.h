//
//  MapperBaseModel.h
//  SwipeTestApp
//
//  Created by Artur Mirrov on 04.07.16.
//  Copyright © 2016 Artur Mirrov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EasyMapping.h"

@interface MapperBaseModel : NSObject <EKMappingProtocol>

- (nonnull instancetype)initWithProperties:(nonnull NSDictionary *)properties;
+ (nonnull EKObjectMapping *)objectMapping;

@end
