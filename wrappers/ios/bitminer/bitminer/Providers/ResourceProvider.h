//
//  ResourceProvider.h
//  bitminer
//
//  Created by Play on 5/18/14.
//  Copyright (c) 2014 Braindump Relief. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResourceProvider : NSObject

/**
 * Returns the absolute path of a resource found in the Resources.bundle bundle.  If the requested resource
 * does not exist, nil is returned.
 */
+(NSString *)pathForResource:(NSString *)resourceName ofType:(NSString *)resourceType inDirectory:(NSString *)directory;

/**
 * Returns the contents of a plist file with a NSDictionary as its root element.
 */
+(NSDictionary *)dictionaryContentsForPlist:(NSString *)plistFileName;

/**
 * Returns the contents of a plist file with a NSArray as its root element.
 */
+(NSArray *)arrayContentsForPlist:(NSString *)plistFileName;

@end
