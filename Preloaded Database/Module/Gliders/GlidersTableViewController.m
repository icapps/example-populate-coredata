//
//  GlidersTableViewController.m
//  Preloaded Database
//
//  Created by Jelle Vandenbeeck on 09/10/15.
//  Copyright © 2015 iCapps. All rights reserved.
//

#import "GlidersTableViewController.h"

@interface GlidersTableViewController ()

@property (nonatomic, strong) NSArray *gliders;

@end

@implementation GlidersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gliders = @[];
}

#pragma mark - UITableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.gliders count];
}

@end
