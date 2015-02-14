//
//  kTabBarController.m
//  lottery
//
//  Created by Kengsir on 2/14/15.
//  Copyright (c) 2015 Kengsir. All rights reserved.
//

/** button的状态 **
    normal : 普通状态
    highlighted : 高亮状态 （ 用户长按的时候达到这个状态）
    disable : enable ＝ NO
    selected : selected = YES
  */

#import "kTabBarController.h"
#import "kTagBar.h"


@interface kTabBarController () <kTagBarDelegate>

@end

@implementation kTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 删除掉系统自带的tabbar
    //[self.tabBar removeFromSuperview];
    
    // 新建自定义tabar
    kTagBar * newTabBar  = [[kTagBar alloc]init];   // 执行init方法内部会调用 (id)initWithFrame
    
    // bounds 填充
    newTabBar.frame = self.tabBar.bounds;
    
    newTabBar.delegate = self;
    [newTabBar setBackgroundColor: [UIColor redColor]];
    [self.tabBar addSubview:newTabBar];

    // 设置导航栏的主题 <全局>
    UINavigationBar *navBAr = [UINavigationBar appearance];
    
    // 背景图片
    [navBAr setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    // 设置title文字的属性
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    
    attrs[UITextAttributeFont] = [UIFont systemFontOfSize:20];
    [navBAr setTitleTextAttributes:attrs];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - 实现tagbar 代理方法
- (void)tagBar:(kTagBar *)tarBar DidSelectedButtonFrom:(int)from To:(int)to
{
    // 选中最新的控制器
    self.selectedIndex = to;
}






@end
