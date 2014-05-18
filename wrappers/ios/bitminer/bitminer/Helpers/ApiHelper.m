//
//  ApiHelper.m
//  bitminer
//
//  Created by Play on 5/18/14.
//  Copyright (c) 2014 Braindump Relief. All rights reserved.
//

#import "ApiHelper.h"
#import "Miner.h"
#import "NSArray+Enumerable.h"
#import "ResourceProvider.h"
#import "UrlUtils.h"

@implementation ApiHelper

+(NSString *)getApiBaseUri {
    NSDictionary *settings = [ResourceProvider dictionaryContentsForPlist:@"bitminer-Settings"];
    NSString *apiBaseUri = [settings objectForKey:@"ApiBaseUri"];
    return apiBaseUri;
}

+ (void)retrieveMinersWithSuccess:(void (^)(NSURLResponse *response, NSData *data))success failure:(void (^)(NSError *error))failure {
    [UrlUtils getAsyncDataFromUrl:[NSString stringWithFormat:@"%@/miners.json", [ApiHelper getApiBaseUri]] forHTTPMethod:@"GET" withBodyParts:nil withHeaders:nil success:success failure:failure];
}

+ (NSArray *)handleRetrieveMinersResponse:(NSData *)responseData {
    NSError *jsonError = nil;
    id result = [NSJSONSerialization JSONObjectWithData:responseData
                                                options:0
                                                  error:&jsonError];
    if (jsonError) {
        return @[];
    }

    NSMutableArray *miners = [[NSMutableArray alloc] init];
    if ([result isKindOfClass:[NSArray class]]) {
        miners = result;

        miners = [NSMutableArray arrayWithArray:
                [miners collect:^id(NSDictionary *minerJSON) {
                    NSError *error = nil;
                    Miner *miner = [MTLJSONAdapter modelOfClass:Miner.class fromJSONDictionary:minerJSON error:&error];
                    return miner;
                }]
        ];
    }

    return miners;
}


@end
