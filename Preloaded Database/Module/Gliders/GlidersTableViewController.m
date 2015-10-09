//
//  GlidersTableViewController.m
//  Preloaded Database
//
//  Created by Jelle Vandenbeeck on 09/10/15.
//  Copyright © 2015 iCapps. All rights reserved.
//

#import <MagicalRecord/MagicalRecord.h>

#import "GlidersTableViewController.h"

#import "Glider.h"

@interface GlidersTableViewController ()

@property (nonatomic, strong) NSArray *gliders;

@end

@implementation GlidersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gliders = [Glider MR_findAllSortedBy:@"immatriculation" ascending:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.title = @"Gliders";
}

#pragma mark - UITableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.gliders count];
}

@end
