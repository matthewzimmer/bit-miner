//
//  UrlUtils.h
//  bitminer
//
//  Created by Play on 5/18/14.
//  Copyright (c) 2014 Braindump Relief. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UrlUtils : NSObject

+(void)getAsyncDataFromUrl:(NSString *)url forHTTPMethod:(NSString *)httpMethod withBodyParts:(NSDictionary *)bodyParts withHeaders:(NSDictionary *)headers success:(void (^)(NSURLResponse *response, NSData *data))success failure:(void (^)(NSError *error))failure;

@end
