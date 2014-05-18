//
// Created by Play on 5/18/14.
// Copyright (c) 2014 Braindump Relief. All rights reserved.
//

#import "MTLModel+NSCoding.h"
#import "Block.h"
#import "MTLValueTransformer.h"


@implementation Block

+ (NSDateFormatter *)dateFormatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    return dateFormatter;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
            @"id" : @"id",
            @"minerID" : @"miner_id",
            @"magicNumber" : @"magic_number",
            @"version" : @"version",
            @"hashCurrBlock" : @"hash_curr_block",
            @"hashPrevBlock" : @"hash_prev_block",
            @"rewardedTransactionFee" : @"rewarded_transaction_fee",
            @"rewardedBitcoins" : @"rewarded_bitcoins",
            @"minedAt" : @"mined_at"
    };
}

+ (NSValueTransformer *)minedAtJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *str) {
        return [self.dateFormatter dateFromString:str];
    } reverseBlock:^(NSDate *date) {
        return [self.dateFormatter stringFromDate:date];
    }];
}

@end