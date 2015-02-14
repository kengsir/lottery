//
//  kTagBar.m
//  lottery
//
//  Created by Kengsir on 2/14/15.
//  Copyright (c) 2015 Kengsir. All rights reserved.
//

#import "kTagBar.h"
#import "kTabBarButton.h"
#define kTagBarButtonCount 5

@interface kTagBar ()
/**
 记录当前按钮的选中状态
 */
@property (nonatomic, weak)kTabBarButton * selectedBtn;


@end

@implementation kTagBar


/** init方法内部会调用initWithFrame
 *  UI控件在initWithFrame 中执行初始化操作 , 添加子控件
 */
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 添加5个按钮
        for (int i = 0; i < kTagBarButtonCount; i ++) {
            // 创建按钮
            kTabBarButton *tabBarBtn = [kTabBarButton buttonWithType:UIButtonTypeCustom];
            
            tabBarBtn.tag = i;  //  绑定一个tag标示，用来确定哪个按钮，绑定之后的按钮就有了tag标示
            //NSLog(@"tabBarBtn.tag ----> %d",tabBarBtn.tag);
            
            // 设置图片
            NSString * name = [NSString stringWithFormat:@"TabBar%d" , i + 1] ;
            [tabBarBtn setBackgroundImage:[UIImage imageNamed: name] forState:UIControlStateNormal];
            NSString * Selname = [NSString stringWithFormat:@"TabBar%dSel" , i + 1] ;
            [tabBarBtn setBackgroundImage:[UIImage imageNamed: Selname] forState:UIControlStateSelected];
            
            
            // 添加
            [self addSubview:tabBarBtn];
            
            // 监听
#warning UIControlEventTouchDown : 手指一按下去就会触发
            [tabBarBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
            
            //将第一个按钮默认选中
            if(i == 0){
                [self buttonClick:tabBarBtn];
            }
            
        }
}
    return self;
}

// 摆正控件frame
-(void)layoutSubviews
{
    [super layoutSubviews];
    for (int i = 0; i < kTagBarButtonCount; i ++) {
        
        // tabbar中的subviews子控件必须是按钮啊！！！
        kTabBarButton * tabBarBtn = self.subviews[i];
        // 设置frame
        CGFloat buttonY = 0;
        CGFloat buttonW = self.frame.size.width  / kTagBarButtonCount ; // 乘与 0。2
        CGFloat buttonH = self.frame.size.height;
        CGFloat buttonX = i * buttonW;
        tabBarBtn.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
    }
}

/**
 *  监听按钮点击啊
 */
-(void)buttonClick : (kTabBarButton * )button
{
    //设置代理 , 通知控制器按钮已经被点击了
    if ( [self.delegate respondsToSelector:@selector(tagBar:DidSelectedButtonFrom:To:)]) {
        [self.delegate tagBar:self DidSelectedButtonFrom:self.selectedBtn.tag To:button.tag];
    }
    
    // 1. 将当前选中的按钮取消选中
    self.selectedBtn.selected = NO;
    
    // 2. 让新点击的按钮选中
    button.selected = YES;
    
    // 3. 新点击的按钮就成为当前选中的按钮
    self.selectedBtn = button;
    
    //self.selectedIndex =  button.tag;
   // NSLog(@"button.tag----> %d",button.tag);
    
  
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
