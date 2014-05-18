//
// Created by Play on 5/18/14.
// Copyright (c) 2014 Braindump Relief. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface StatSheet : MTLModel <MTLJSONSerializing>

@property (nonatomic) NSNumber *id;
@property (nonatomic) NSNumber *minerID;
@property (nonatomic) NSNumber *blocksMined;
@property (nonatomic) NSNumber *timeBetweenBlocks;
@property (nonatomic) NSNumber *bitcoinsMined;
@property (nonatomic) NSNumber *totalTransactionFees;
@property (nonatomic) NSNumber *numberOfTransactions;

@end