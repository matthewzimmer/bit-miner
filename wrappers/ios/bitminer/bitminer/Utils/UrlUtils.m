//
//  UrlUtils.m
//  bitminer
//
//  Created by Play on 5/18/14.
//  Copyright (c) 2014 Braindump Relief. All rights reserved.
//

#import "UrlUtils.h"

@implementation UrlUtils

+(void)getAsyncDataFromUrl:(NSString *)url forHTTPMethod:(NSString *)httpMethod withBodyParts:(NSDictionary *)bodyParts withHeaders:(NSDictionary *)headers success:(void (^)(NSURLResponse *response, NSData *data))success failure:(void (^)(NSError *error))failure {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    if(headers != nil) {
        [request setAllHTTPHeaderFields:headers];
    }

    NSMutableString *method = nil;
    if(nil != httpMethod) {
        method = [NSMutableString stringWithString:httpMethod];
    }
    if(nil == method) {
        method = [NSMutableString stringWithString:@"GET"];
    }

    if(nil != bodyParts) {
        NSString *body = [self addQueryStringToUrlString:@"" withDictionary:bodyParts];
        [request setHTTPBody:[NSData dataWithBytes:[body UTF8String] length:[body length]]];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
    }

    [request setHTTPMethod:method];
    [request setCachePolicy:NSURLRequestReloadIgnoringCacheData];
    [request setTimeoutInterval:60];

    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if(nil == connectionError) {
            if(success) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    success(response, data);
                });
            }
        } else {
            if(failure) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    failure(connectionError);
                });
            }
        }
    }];
}

+(NSString*)addQueryStringToUrlString:(NSString *)urlString withDictionary:(NSDictionary *)dictionary
{
    NSMutableString *urlWithQuerystring = [[NSMutableString alloc] initWithString:urlString];

    for (id key in dictionary) {
        NSString *keyString = [key description];
        NSString *valueString = [[dictionary objectForKey:key] description];

        if ([urlWithQuerystring rangeOfString:@"?"].location == NSNotFound) {
            [urlWithQuerystring appendFormat:@"?%@=%@", [self urlEscapeString:keyString], [self urlEscapeString:valueString]];
        } else {
            [urlWithQuerystring appendFormat:@"&%@=%@", [self urlEscapeString:keyString], [self urlEscapeString:valueString]];
        }
    }
    return [urlWithQuerystring substringFromIndex:1];
}

+(NSString*)urlEscapeString:(NSString *)unencodedString
{
    CFStringRef originalStringRef = (__bridge_retained CFStringRef)unencodedString;
    NSString *s = (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,originalStringRef, NULL, NULL,kCFStringEncodingUTF8);
    CFRelease(originalStringRef);
    return s;
}

@end
