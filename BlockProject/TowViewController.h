//
//  TowViewController.h
//  BlockProject
//
//  Created by qzwh on 2018/6/18.
//  Copyright © 2018年 qzwh. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^blockString)(NSString *string);

@interface TowViewController : UIViewController

//@property (nonatomic, strong) NSString *string;
//这里为什么使用copy
//1.strong 表示在栈创建了一block变量，但是block是延后执行这一特点，会造成这个block变量被置为nil
//2.栈的内存空间，是系统决定收回的。前面开辟空间创建的变量，由于创建变量时空间不够，系统就会回收前面的变量空间
//3.copy 表示把block内存区域里面的东西，复制一份到堆中。
//4.堆的内存空间，是由程序员来控制的。开辟和回收空间都是由程序员自己操作。
@property (nonatomic, copy) blockString stringName;

@end
