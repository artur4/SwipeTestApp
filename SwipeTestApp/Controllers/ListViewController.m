//
//  ListViewController.m
//  SwipeTestApp
//
//  Created by Artur Mirrov on 04.07.16.
//  Copyright © 2016 Artur Mirrov. All rights reserved.
//

#import "ListViewController.h"
#import "CoreDataManager.h"
#import "ListTableViewCell.h"
#import "DetailItem.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface ListViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)close:(id)sender;

@end

static NSString *tableCellId = @"tableCell";

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.fetchedResultsController.delegate = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ListTableViewCell class]) bundle:nil] forCellReuseIdentifier:tableCellId];
}

- (IBAction)close:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITableViewDataSource

-(ListTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableCellId forIndexPath:indexPath];
    
    DetailItem *object = [self objectAtIndexPath:indexPath];
    
    cell.titleLabel.text = object.title;
    [cell.coverImageView sd_setImageWithURL:object.cover
                           placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    cell.descLabel.text = object.desc;
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id <NSFetchedResultsSectionInfo> sectionIndex = self.fetchedResultsController.sections[section];
    return sectionIndex.numberOfObjects;
}

- (id)objectAtIndexPath:(NSIndexPath*)indexPath {
    return [self.fetchedResultsController objectAtIndexPath:indexPath];
}

#pragma mark NSFetchedResultsControllerDelegate
- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
