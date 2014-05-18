//
//  ApiHelper.h
//  bitminer
//
//  Created by Play on 5/18/14.
//  Copyright (c) 2014 Braindump Relief. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApiHelper : NSObject

+(NSString *)getApiBaseUri;

+ (void)retrieveMinersWithSuccess:(void (^)(NSURLResponse *response, NSData *data))success
                       failure:(void (^)(NSError *error))failure;

// Returns an NSArray of Friend objects.
+(NSArray *)handleRetrieveMinersResponse:(NSData *)responseData;
@end
