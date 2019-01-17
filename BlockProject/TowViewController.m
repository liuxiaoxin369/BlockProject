//
//  TowViewController.m
//  BlockProject
//
//  Created by qzwh on 2018/6/18.
//  Copyright © 2018年 qzwh. All rights reserved.
//

#import "TowViewController.h"

@interface TowViewController ()
@property (weak, nonatomic) IBOutlet UIButton *endBtn;
@property (weak, nonatomic) IBOutlet UITextField *towText;

@end

@implementation TowViewController
- (IBAction)endActionBtn:(id)sender {
    __weak typeof(self) weakSelf = self;
    //这里的判断是为了防止block为空的情况
    if (self.stringName) {
        //防止代码执行的过程中self被释放掉，从而导致代码崩溃
        __strong typeof(self) strongSelf = weakSelf;
        self.stringName(strongSelf.towText.text);
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.towText.text = @"block值传到前面了";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
