//
//  Children.m
//  KVO_App
//
//  Created by Akash Rastogi on 25/06/15.
//  Copyright (c) 2015 Akash. All rights reserved.
//

#import "Children.h"

@implementation Children
-(id)init{
    self = [super init];
    if (self) {
        self.name = @"";
        self.age = 0;
        self.cousins = [KVCMutableArray new];
    }
    return self;
}
@end
