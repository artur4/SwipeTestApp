//
//  ListViewController.h
//  SwipeTestApp
//
//  Created by Artur Mirrov on 04.07.16.
//  Copyright © 2016 Artur Mirrov. All rights reserved.
//

#import <UIKit/UIKit.h>
@import CoreData;
@class CoreDataManager;

@interface ListViewController : UIViewController <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) CoreDataManager *coreDataManager;

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end
