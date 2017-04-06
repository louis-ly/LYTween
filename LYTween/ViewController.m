//
//  ViewController.m
//  LYTween
//
//  Created by louis on 2017/4/6.
//  Copyright © 2017年 louis. All rights reserved.
//

#import "ViewController.h"
#import "LYDetailVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Tween";
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    LYDetailVC *destinationVC = [segue destinationViewController];
    destinationVC.type = self.tableView.indexPathForSelectedRow.row;
    destinationVC.title = [self.tableView cellForRowAtIndexPath:self.tableView.indexPathForSelectedRow].textLabel.text;
}

@end
