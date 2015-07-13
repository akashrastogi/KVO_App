//
//  KVCMutableArray.h
//  KVO_App
//
//  Created by Akash Rastogi on 25/06/15.
//  Copyright (c) 2015 Akash. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KVCMutableArray : NSObject
@property(nonatomic, strong) NSMutableArray *array;

-(NSUInteger)countOfArray;
-(id)objectInArrayAtIndex:(NSUInteger)index;
-(void)insertObject:(id)object inArrayAtIndex:(NSUInteger)index;
-(void)removeObjectFromArrayAtIndex:(NSUInteger)index;
-(void)replaceObjectInArrayAtIndex:(NSUInteger)index withObject:(id)object;

@end
