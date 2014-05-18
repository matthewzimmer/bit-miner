//
//  ResourceProvider.m
//  bitminer
//
//  Created by Play on 5/18/14.
//  Copyright (c) 2014 Braindump Relief. All rights reserved.
//

#import "ResourceProvider.h"

@implementation ResourceProvider

static NSString *RESOURCE_NAME = @"Resources";
static NSMutableDictionary *RESOURCE_CACHE = nil;

+(NSString *)pathForResource:(NSString *)resourceName ofType:(NSString *)resourceType inDirectory:(NSString *)directory {
    NSString *resourcesBundlePath = [[NSBundle mainBundle] pathForResource:RESOURCE_NAME ofType:@"bundle"];

    if([resourcesBundlePath length] > 0) {
        NSBundle *resourcesBundle = [NSBundle bundleWithPath:resourcesBundlePath];
        if(resourcesBundle != nil) {
            NSString *resourcePath = [resourcesBundle pathForResource:resourceName ofType:resourceType inDirectory:directory];
            return resourcePath;
        }
    }

    return nil;
}

+(NSDictionary *)dictionaryContentsForPlist:(NSString *)plistFileName {
    NSMutableDictionary *cache = [self resourceCache];
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:plistFileName ofType:@"plist"];
    NSDictionary *plistContents = [cache objectForKey:plistPath];

    if(plistContents == nil) {
        plistContents = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
        [cache setObject:plistContents forKey:plistPath];
    }

    return plistContents;
}

+(NSArray *)arrayContentsForPlist:(NSString *)plistFileName {
    NSMutableDictionary *cache = [self resourceCache];
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:plistFileName ofType:@"plist"];
    NSArray *plistContents = [cache objectForKey:plistPath];

    if(plistContents == nil) {
        plistContents = [[NSArray alloc] initWithContentsOfFile:plistPath];
        [cache setObject:plistContents forKey:plistPath];
    }

    return plistContents;
}

+(NSMutableDictionary *)resourceCache {
    if(nil == RESOURCE_CACHE) {
        RESOURCE_CACHE = [[NSMutableDictionary alloc] init];
    }
    return RESOURCE_CACHE;
}

@end
