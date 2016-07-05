//
//  ServceLayerManager.m
//  SwipeTestApp
//
//  Created by Artur Mirrov on 04.07.16.
//  Copyright © 2016 Artur Mirrov. All rights reserved.
//

#import "ServceLayerManager.h"
#import "ItemModel.h"


@implementation ServceLayerManager

- (void)getItemsOnResult:(void(^)(ItemModel *data)) result
               onFailure:(void(^)(NSError *error)) failure {
    
    [self.manager GET:@"http://stickinza.com/api/items/next" parameters:nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSDictionary *items = responseObject[@"items"];
        ItemModel *model = [[ItemModel alloc] initWithProperties:items];
        
        if (result) {
            result(model);
        }
    } failure:^(NSURLSessionDataTask *task, NSError * error) {
        if (failure) {
            
            failure(error);
        }
    }];
}

@end
