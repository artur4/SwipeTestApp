//
//  AppAssembly.m
//  SwipeTestApp
//
//  Created by Artur Mirrov on 04.07.16.
//  Copyright © 2016 Artur Mirrov. All rights reserved.
//

#import "AppAssembly.h"
#import "AppDelegate.h"
#import "MainViewController.h"
#import "ListViewController.h"
#import "ServceLayerManager.h"
#import "CoreDataManager.h"
#import "YSLDraggableCardContainer.h"

@implementation AppAssembly

- (AppDelegate *)appDelegate {
    return [TyphoonDefinition withClass:[AppDelegate class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(coreDataManager) with:[self coreDataManager]];
    }];
}
/* ----------------------------------------------- Controllers ----------------------------------------------------*/
- (MainViewController *)mainViewController {
    return [TyphoonDefinition withClass:[MainViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(servceLayerManager) with:[self servceLayerManager]];
        [definition injectProperty:@selector(draggableCardContainer) with:[self draggableCardContainer]];
        [definition injectProperty:@selector(coreDataManager) with:[self coreDataManager]];
    }];
}
- (YSLDraggableCardContainer *)draggableCardContainer {
    return [TyphoonDefinition withClass:[YSLDraggableCardContainer class]];
}


- (ListViewController *)listViewController {
    return [TyphoonDefinition withClass:[ListViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(coreDataManager) with:[self coreDataManager]];
        [definition injectProperty:@selector(fetchedResultsController) with:[self fetchedResultsController]];
    }];
}

/* ----------------------------------------------- Managers ----------------------------------------------------*/
 
- (ServceLayerManager *)servceLayerManager {
    return [TyphoonDefinition withClass:[ServceLayerManager class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(manager) with:[self manager]];
        definition.scope = TyphoonScopeSingleton;
    }];
}
- (AFHTTPSessionManager *)manager {
    return [TyphoonDefinition withClass:[AFHTTPSessionManager class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithBaseURL:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:nil];
        }];
    }];
}


- (CoreDataManager *)coreDataManager {
    return [TyphoonDefinition withClass:[CoreDataManager class] configuration:^(TyphoonDefinition *definition) {
        definition.scope = TyphoonScopeSingleton;
    }];
}


/* ------------------------------------ NSFetchedResultsController ----------------------------------------------*/
- (NSFetchedResultsController *)fetchedResultsController {
    return [TyphoonDefinition withClass:[NSFetchedResultsController class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:[self fetchRequest]];
            [initializer injectParameterWith:[(TyphoonDefinition*)[self coreDataManager] keyPath:@"managedObjectContext"]];
            [initializer injectParameterWith:nil];
            [initializer injectParameterWith:nil];
        }];
        [definition injectMethod:@selector(performFetch:) parameters:^(TyphoonMethod *method) {
            [method injectParameterWith:nil];
        }];
    }];
}

- (NSFetchRequest *)fetchRequest {
    return [TyphoonDefinition withClass:[NSFetchRequest class]configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithEntityName:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:@"DetailItem"];
        }];
        [definition injectProperty:@selector(sortDescriptors) with:@[[NSSortDescriptor sortDescriptorWithKey:@"id_item" ascending:YES]]];
    }];
}

- (NSError *)error {
    return [TyphoonDefinition withClass:[NSError class]];
}

@end
