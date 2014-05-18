//
// Created by Play on 5/18/14.
// Copyright (c) 2014 Braindump Relief. All rights reserved.
//

#import "MTLModel+NSCoding.h"
#import "MTLJSONAdapter.h"
#import "StatSheet.h"


@implementation StatSheet

+ (NSDateFormatter *)dateFormatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    return dateFormatter;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
            @"id": @"id",
            @"minerID": @"miner_id",
            @"blocksMined": @"blocks_mined",
            @"timeBetweenBlocks": @"time_between_blocks",
            @"bitcoinsMined": @"bitcoins_mined",
            @"totalTransactionFees": @"total_transaction_fees",
            @"numberOfTransactions": @"number_of_transactions"
    };
}

@end