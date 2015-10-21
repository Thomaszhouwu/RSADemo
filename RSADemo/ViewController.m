//
//  ViewController.m
//  RSADemo
//
//  Created by 德益富 on 15/10/21.
//  Copyright © 2015年 Dyf. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Hash.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)rsaEncodeClicked:(id)sender {
    NSString *code=[NSString encryptRSA:@"1122334455667788"];
    NSLog(@"--code->%@",code);
}

- (IBAction)rsaDecodeClicked:(id)sender {
    NSString *code=[NSString decryptRSA:@"1122334455667788"];
    NSLog(@"--code->%@",code);
}

@end
