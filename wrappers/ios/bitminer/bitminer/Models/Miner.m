//
//  Miner.m
//  bitminer
//
//  Created by Play on 5/18/14.
//  Copyright (c) 2014 Braindump Relief. All rights reserved.
//

#import "Miner.h"
#import "Profile.h"
#import "StatSheet.h"
#import "Block.h"
#import "NSValueTransformer+MTLPredefinedTransformerAdditions.h"

@implementation Miner

+ (NSDateFormatter *)dateFormatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    return dateFormatter;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
            @"id": @"id",
            @"profile": @"profile",
            @"statSheet": @"stat_sheet",
            @"blocks": @"blocks"
    };
}

+(NSValueTransformer *)JSONTransformerForKey:(NSString *)key {
    if([key isEqualToString:@"blocks"]) {
        return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:Block.class];
    }
    return nil;
}

+ (NSValueTransformer *)profileJSONTransformer {
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:Profile.class];
}

+ (NSValueTransformer *)statSheetJSONTransformer {
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:StatSheet.class];
}

@end
