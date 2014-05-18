//
//  BMMinerCell.m
//  bitminer
//
//  Created by Play on 5/18/14.
//  Copyright (c) 2014 Braindump Relief. All rights reserved.
//

#import "BMMinerCell.h"
#import "Miner.h"

@implementation BMMinerCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)prepareForReuse {
    [super prepareForReuse];
    self.avatarImage.image = nil;
    self.miner = nil;
}

- (void)setAvatarImageUrl:(NSString *)avatarImageUrl {
    if(avatarImageUrl == nil) {
        avatarImageUrl = DEFAULT_AVATAR_PREVIEW_URL;
    }

    NSURL *imageURL = [NSURL URLWithString:avatarImageUrl];
    NSLog(@"About to download avatar image at:\n\n%@", avatarImageUrl );

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:imageURL];
        [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
        [request setTimeoutInterval:60];
        NSData *imageData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];

        dispatch_async(dispatch_get_main_queue(), ^{
            [self.avatarImage setImage:[UIImage imageWithData:imageData]];
        });
    });

}

@end
