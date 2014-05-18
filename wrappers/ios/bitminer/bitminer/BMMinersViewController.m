//
//  BMMinersViewController.m
//  bitminer
//
//  Created by Play on 5/18/14.
//  Copyright (c) 2014 Braindump Relief. All rights reserved.
//

#import "BMMinersViewController.h"
#import "SVProgressHUD.h"
#import "Miner.h"
#import "ApiHelper.h"
#import "Profile.h"
#import "BMMinerCell.h"
#import "StatSheet.h"

@interface BMMinersViewController ()
@property (strong, nonatomic) NSArray *dataSource;
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@property(strong, nonatomic) Miner *selectedMiner;
@end

@implementation BMMinersViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    [self injectRefreshControl];
    [self handleRefresh];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)injectRefreshControl {
    UITableViewController *tableViewController = [[UITableViewController alloc] init];
    tableViewController.tableView = self.tableView;

    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(handleRefresh) forControlEvents:UIControlEventValueChanged];
    tableViewController.refreshControl = self.refreshControl;
}

-(void)handleRefresh {
    self.dataSource = @[];
    [self retrieveMiners];
}

- (void)retrieveMiners {
    [SVProgressHUD showWithStatus:@"Downloading miners..." maskType:SVProgressHUDMaskTypeBlack];
    [ApiHelper retrieveMinersWithSuccess:^(NSURLResponse *response, NSData *data) {
        NSMutableArray *miners = [[ApiHelper handleRetrieveMinersResponse:data] mutableCopy];

        self.dataSource = miners;
        [self.tableView reloadData];
        [self.refreshControl endRefreshing];

        if(miners.count <= 0) {
            [SVProgressHUD showSuccessWithStatus:@"No miners found. Add one or more miners using the Rails app and try again."];
        } else {
            [SVProgressHUD dismiss];
        }

    } failure:^(NSError *error) {
        [self.refreshControl endRefreshing];
        [SVProgressHUD dismiss];
    }];
}

#pragma mark - UITableViewDataSource Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.tableView) {
        self.selectedMiner = _dataSource[[indexPath row]];
        NSLog(@"Wants to view %@ inventory.", [NSString stringWithFormat:@"%@'s", self.selectedMiner.profile.nickname]);
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"MinerCell";
    UITableViewCell *cell = nil;
    
    Miner *miner = _dataSource[[indexPath row]];
    
    BMMinerCell *minerCell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (minerCell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.text = miner.profile.nickname;
    } else {
        minerCell.miner = miner;
        minerCell.nicknameLabel.text = miner.profile.nickname;
        minerCell.blocksMinedLabel.text = [NSString stringWithFormat:@"%@ Blocks Mined", miner.statSheet.blocksMined];
        minerCell.bitcoinsMinedLabel.text = [NSString stringWithFormat:@"%@ BTC Mined", miner.statSheet.bitcoinsMined];
        minerCell.transactionFeesLabel.text = [NSString stringWithFormat:@"$%@ Transaction Fees", miner.statSheet.totalTransactionFees];
        [minerCell setAvatarImageUrl:miner.profile.avatarUrl];
        cell = minerCell;
    }

    return cell;
}
@end
