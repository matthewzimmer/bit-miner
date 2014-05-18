//
// Created by Play on 5/18/14.
// Copyright (c) 2014 Braindump Relief. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTLJSONAdapter.h"


@interface Block : MTLModel <MTLJSONSerializing>

@property (nonatomic) NSNumber *id;
@property (nonatomic) NSNumber *minerID;
@property (nonatomic) NSString *magicNumber;
@property (nonatomic) NSNumber *version;
@property (nonatomic) NSString *hashCurrBlock;
@property (nonatomic) NSString *hashPrevBlock;
@property (nonatomic) NSNumber *rewardedTransactionFee;
@property (nonatomic) NSNumber *rewardedBitcoins;
@property (nonatomic) NSDate *minedAt;

@end