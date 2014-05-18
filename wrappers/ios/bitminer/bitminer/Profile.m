//
// Created by Play on 5/18/14.
// Copyright (c) 2014 Braindump Relief. All rights reserved.
//

#import "MTLModel+NSCoding.h"
#import "Profile.h"


@implementation Profile

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
            @"nickname": @"nickname",
            @"firstName": @"first_name",
            @"lastName": @"last_name",
            @"bio": @"bio",
            @"reputation": @"reputation",
            @"isPublic": @"is_public",
            @"avatarUrl": @"avatar_medium_url"
    };
}

//+ (NSValueTransformer *)avatarUrlJSONTransformer {
//    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
//}

@end