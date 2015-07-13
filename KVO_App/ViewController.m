//
//  ViewController.m
//  KVO_App
//
//  Created by Akash Rastogi on 25/06/15.
//  Copyright (c) 2015 Akash. All rights reserved.
//

#import "ViewController.h"

static void *contextChild1 = &contextChild1;
static void *contextChild2 = &contextChild2;
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.child1 = [Children new];
    self.child2 = [Children new];
}

-(void)viewWillAppear:(BOOL)animated{
    [self.child1 addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:contextChild1];
    [self.child1 addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:contextChild1];
    [self.child2 addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:contextChild2];
    
    [self.child1 setValue:@"George" forKey:@"name"];
    [self.child1 setValue:[NSNumber numberWithInteger:20] forKey:@"age"];
    
    [self.child2 setValue:@"John" forKey:@"name"];
    [self.child2 setValue:[NSNumber numberWithInteger:30] forKey:@"age"];
    
    [self.child1 setValue:@"Simon" forKey:@"name"];
    
    [self.child1 addObserver:self forKeyPath:@"cousins.array" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:contextChild1];

    [self.child1.cousins insertObject:@"Antony" inArrayAtIndex:0];
    [self.child1.cousins insertObject:@"Julia" inArrayAtIndex:1];
    [self.child1.cousins replaceObjectInArrayAtIndex:0 withObject:@"Ben"];
}

-(void)viewWillDisappear:(BOOL)animated{
    [self.child1 removeObserver:self forKeyPath:@"name"];
    [self.child1 removeObserver:self forKeyPath:@"age"];
    [self.child2 removeObserver:self forKeyPath:@"name"];
    
    [self.child1 removeObserver:self forKeyPath:@"cousins.array"];
    [self.child2 removeObserver:self forKeyPath:@"cousins.array"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if (context == contextChild1) {
        if ([keyPath isEqualToString:@"name"]) {
            NSLog(@"The name of the FIRST child was changed.");
            NSLog(@"%@", change);
        }
        
        if ([keyPath isEqualToString:@"age"]) {
            NSLog(@"The age of the FIRST child was changed.");
            NSLog(@"%@", change);
        }
        
        if ([keyPath isEqualToString:@"cousins.array"]) {
            NSLog(@"The Siblings of the FIRST child was changed.");
            NSLog(@"%@", change);
        }
    }
    else if (context == contextChild2){
        if ([keyPath isEqualToString:@"age"]) {
            NSLog(@"The age of the SECOND child was changed.");
            NSLog(@"%@", change);
        }
    }
}
@end
