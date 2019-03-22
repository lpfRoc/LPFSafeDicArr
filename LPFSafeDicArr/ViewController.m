//
//  ViewController.m
//  LPFSafeDicArr
//
//  Created by Roc on 2017/3/22.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()
/** btn */
@property (nonatomic,strong) UIButton *btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *arr = @[@1,@2] ;
    NSArray *arr1 = @[@1] ;
    NSArray *arr2 =@[];
    id a = arr[100];
    NSLog(@"%@",a);
    
    NSArray *arr4 =  [[NSArray alloc]init];
    NSLog(@"%@",[arr4 class]);
    NSMutableArray *arr5 = [@[@"1"] mutableCopy];
        NSLog(@"arr1 == %@",[arr1 class]);
    NSLog(@"arr5 == %@",[arr5 class]);
    id b = arr1[100];
    NSLog(@"%@",b);
    
    id c = [arr2 objectAtIndex:5];
    NSLog(@"%@",c);
    
    NSMutableArray *array = [@[@"value", @"value1"]     mutableCopy];
    [array removeObject:@"value"];
    [array objectAtIndex:111];
    NSLog(@"%@",array[111]);
    
    NSString *string;
    NSMutableDictionary *dic = [@{@"key1":string,@"key2":@"value2"} mutableCopy];
    NSLog(@"%@",dic);
    NSLog(@"----%@", [dic objectForKey:@"key1"]);
    
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(100, 100, 100, 50);
    [btn setBackgroundColor:[UIColor redColor]];
    [btn addTarget:self action:@selector(btnActin) forControlEvents:(UIControlEventTouchUpInside)];
    [btn setTitle:@"123" forState:(UIControlStateNormal)];
    [self.view addSubview:btn];
    self.btn = btn;
}
-(void)btnActin
{
    static int i = 1;
    i++;
    NSString *a = [NSString stringWithFormat:@"%d",i];
    [_btn setTitle:a forState:(UIControlStateNormal)];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
