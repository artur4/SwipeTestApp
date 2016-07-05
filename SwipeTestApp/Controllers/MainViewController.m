//
//  MainViewController.m
//  SwipeTestApp
//
//  Created by Artur Mirrov on 04.07.16.
//  Copyright © 2016 Artur Mirrov. All rights reserved.
//

#import "MainViewController.h"
#import "ServceLayerManager.h"
#import "ItemModel.h"
#import "DetailItemModel.h"
#import "YSLDraggableCardContainer.h"
#import "CardView.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "DetailItem.h"
#import "CoreDataManager.h"

@interface MainViewController () <YSLDraggableCardContainerDelegate, YSLDraggableCardContainerDataSource>

@property (nonatomic, strong) NSArray *datas;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation MainViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.datas = [NSArray array];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.draggableCardContainer.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.draggableCardContainer.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.2];
    self.draggableCardContainer.dataSource = self;
    self.draggableCardContainer.delegate = self;
    self.draggableCardContainer.canDraggableDirection = YSLDraggableDirectionLeft | YSLDraggableDirectionRight;
    [self.view addSubview:self.draggableCardContainer];
    
    [self loadData];
}

- (void)loadData {
    
    [self.activityIndicator startAnimating];
    [self.servceLayerManager getItemsOnResult:^(ItemModel *data) {
        
        [self.activityIndicator stopAnimating];
        self.datas = data.items;
        [self.draggableCardContainer reloadCardContainer];
        
    } onFailure:^(NSError *error) {
        [self.activityIndicator stopAnimating];
    }];
}

#pragma mark -- YSLDraggableCardContainer DataSource
- (UIView *)cardContainerViewNextViewWithIndex:(NSInteger)index
{
    DetailItemModel *item = self.datas[index];
    
    CardView *view = [[CardView alloc] initWithFrame:CGRectMake(10, 74, self.view.frame.size.width - 20, self.view.frame.size.height - 64 - 73)];
    
    view.backgroundColor = [UIColor whiteColor];

    [view.imageView sd_setImageWithURL:item.cover
                      placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    view.label.text = item.title;
    
    return view;
}

- (NSInteger)cardContainerViewNumberOfViewInIndex:(NSInteger)index
{
    return _datas.count;
}

#pragma mark -- YSLDraggableCardContainer Delegate
- (void)cardContainerView:(YSLDraggableCardContainer *)cardContainerView didEndDraggingAtIndex:(NSInteger)index draggableView:(UIView *)draggableView draggableDirection:(YSLDraggableDirection)draggableDirection
{
    if (draggableDirection == YSLDraggableDirectionLeft) {
        [cardContainerView movePositionWithDirection:draggableDirection
                                         isAutomatic:NO];
    }
    
    if (draggableDirection == YSLDraggableDirectionRight) {
        [cardContainerView movePositionWithDirection:draggableDirection
                                         isAutomatic:NO];
        
        [self saveDataWithIndex:index];
    }
}


- (void)cardContainerViewDidCompleteAll:(YSLDraggableCardContainer *)container;
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [self loadData];
    });
}

- (void)cardContainerView:(YSLDraggableCardContainer *)cardContainerView didSelectAtIndex:(NSInteger)index draggableView:(UIView *)draggableView
{
    NSLog(@"++ index : %ld",(long)index);
}


#pragma mark -- Action methods
- (IBAction)dislike:(id)sender {
    [self.draggableCardContainer movePositionWithDirection:YSLDraggableDirectionLeft
                                     isAutomatic:YES];
}

- (IBAction)like:(id)sender {
    
    if (self.draggableCardContainer.currentIndex < self.datas.count) {
        [self saveDataWithIndex:self.draggableCardContainer.currentIndex];
    }
    
    [self.draggableCardContainer movePositionWithDirection:YSLDraggableDirectionRight
                                  isAutomatic:YES];
    
}

- (void)saveDataWithIndex:(NSInteger)index {
    
    DetailItemModel *item = self.datas[index];
    [self.coreDataManager.backgroundManagedObjectContext performBlock:^{
        DetailItem *coreDataItem = [DetailItem findOrCreateItemWithIdentifier:item.id_item inContext:self.coreDataManager.backgroundManagedObjectContext];
        [coreDataItem loadDataFromItem:item];
        [self.coreDataManager saveBackgroundContext];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
