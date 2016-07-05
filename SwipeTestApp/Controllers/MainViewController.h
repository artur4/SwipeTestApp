//
//  MainViewController.h
//  SwipeTestApp
//
//  Created by Artur Mirrov on 04.07.16.
//  Copyright © 2016 Artur Mirrov. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ServceLayerManager;
@class YSLDraggableCardContainer;
@class CoreDataManager;

@interface MainViewController : UIViewController

@property (nonatomic, strong) ServceLayerManager *servceLayerManager;

@property (nonatomic, strong) YSLDraggableCardContainer *draggableCardContainer;

@property (nonatomic, strong) CoreDataManager *coreDataManager;

@end
