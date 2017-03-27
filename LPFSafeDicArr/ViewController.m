//
//  ViewController.m
//  LPFSafeDicArr
//
//  Created by Roc on 2017/3/22.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *arr = @[@1,@2] ;
    
    id a = arr[100];
    NSLog(@"%@",a);
    
    NSMutableArray *array = [@[@"value", @"value1"]     mutableCopy];
    [array removeObject:@"value"];
    [array objectAtIndex:111];
    NSLog(@"%@",array[111]);
    
    NSString *string;
    NSMutableDictionary *dic = [@{@"key1":string,@"key2":@"value2"} mutableCopy];
    NSLog(@"%@",dic);
    NSLog(@"----%@", [dic objectForKey:@"key1"]);
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
