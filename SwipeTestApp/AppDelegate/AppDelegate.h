//
//  AppDelegate.h
//  SwipeTestApp
//
//  Created by Artur Mirrov on 04.07.16.
//  Copyright © 2016 Artur Mirrov. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CoreDataManager;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) CoreDataManager *coreDataManager;

@end

