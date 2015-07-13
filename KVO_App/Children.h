//
//  Children.h
//  KVO_App
//
//  Created by Akash Rastogi on 25/06/15.
//  Copyright (c) 2015 Akash. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KVCMutableArray.h"

@interface Children : NSObject
@property (nonatomic, strong)NSString *name;
@property (nonatomic) NSInteger age;
@property (nonatomic, strong) KVCMutableArray *cousins;
@end
