//
//  BMMinerCell.h
//  bitminer
//
//  Created by Play on 5/18/14.
//  Copyright (c) 2014 Braindump Relief. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Miner;

@interface BMMinerCell : UITableViewCell

@property (nonatomic, strong) Miner *miner;
@property (nonatomic, strong) IBOutlet UIImageView *avatarImage;
@property (nonatomic, strong) IBOutlet UILabel *nicknameLabel;
@property (nonatomic, strong) IBOutlet UILabel *blocksMinedLabel;
@property (nonatomic, strong) IBOutlet UILabel *bitcoinsMinedLabel;
@property (nonatomic, strong) IBOutlet UILabel *transactionFeesLabel;

- (void)setAvatarImageUrl:(NSString *)avatarImageUrl;
@end
