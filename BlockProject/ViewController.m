//
//  ViewController.m
//  BlockProject
//
//  Created by qzwh on 2018/6/18.
//  Copyright © 2018年 qzwh. All rights reserved.
//

#import "ViewController.h"
#import "TowViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *startBtn;
@property (weak, nonatomic) IBOutlet UITextField *oneText;

@end

@implementation ViewController
- (IBAction)startAvtionBtn:(id)sender {
    TowViewController *towVC = [[TowViewController alloc] init];
    //前面我们讲过如果外部创建的对象在block内部使用，会把对象的指针传递进去。造成引用计数的增加这里就是出现了这种情况，出现这种情况的结果是会造成循环引用，内存不能被释放。
    //1.twoVC.stringName表示这个controller持有一份当前block内容。
    //2.block中的参数string表示为controller中的self.towText，所以block也持有一份controller
    //3.这样就造成了双方互相持有，从而导致循环引用内存不能够被释放
    towVC.stringName = ^(NSString *string) {
        self.oneText.text = string;
    };
    [self.navigationController pushViewController:towVC animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.oneText.text = @"123456";
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
