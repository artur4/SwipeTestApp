//
//  AppAssembly.h
//  SwipeTestApp
//
//  Created by Artur Mirrov on 04.07.16.
//  Copyright © 2016 Artur Mirrov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Typhoon.h>
@import CoreData;

@class AppDelegate;
@class ServceLayerManager;
@class MainViewController;
@class ListViewController;
@class CoreDataManager;
@class YSLDraggableCardContainer;

@interface AppAssembly : TyphoonAssembly

- (AppDelegate *)appDelegate;

- (ServceLayerManager *)servceLayerManager;

- (MainViewController *)mainViewController;

- (YSLDraggableCardContainer *)draggableCardContainer;

- (CoreDataManager *)coreDataManager;


@end
