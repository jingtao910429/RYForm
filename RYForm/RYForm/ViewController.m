//
//  ViewController.m
//  RYForm
//
//  Created by xiaerfei on 16/5/18.
//  Copyright © 2016年 Rongyu100. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"

@interface ViewController ()
- (IBAction)formAction:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)formAction:(id)sender {
    TestViewController *testView = [[TestViewController alloc] init];
    [self.navigationController pushViewController:testView animated:YES];
}
@end
