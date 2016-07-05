//
//  ServceLayerManager.h
//  SwipeTestApp
//
//  Created by Artur Mirrov on 04.07.16.
//  Copyright © 2016 Artur Mirrov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
@class ItemModel;

@interface ServceLayerManager : NSObject

@property (strong, nonatomic) AFHTTPSessionManager *manager;

- (void)getItemsOnResult:(void(^)(ItemModel *data)) result
               onFailure:(void(^)(NSError *error)) failure;

@end
