//
//  Miner.h
//  bitminer
//
//  Created by Play on 5/18/14.
//  Copyright (c) 2014 Braindump Relief. All rights reserved.
//

#import "MTLModel.h"
#import "MTLJSONAdapter.h"

@class Profile;
@class StatSheet;

@interface Miner : MTLModel<MTLJSONSerializing>

@property (nonatomic) NSNumber *id;
@property (nonatomic) NSString *email;
@property (nonatomic, strong, readonly) Profile *profile;
@property (nonatomic, strong, readonly) StatSheet *statSheet;
@property (nonatomic, copy, readonly) NSArray *blocks;

@end
