//
// Created by Play on 5/18/14.
// Copyright (c) 2014 Braindump Relief. All rights reserved.
//

#import <Mantle/MTLModel.h>
#import <Mantle/MTLJSONAdapter.h>

@interface Profile : MTLModel <MTLJSONSerializing>

@property (nonatomic) NSNumber *id;
@property (nonatomic) NSNumber *minerID;
@property (nonatomic) NSString *nickname;
@property (nonatomic) NSString *firstName;
@property (nonatomic) NSString *lastName;
@property (nonatomic) NSString *bio;
@property (nonatomic) NSNumber *reputation;
@property (nonatomic) BOOL isPublic;
@property (nonatomic) NSString *avatarUrl;

@end