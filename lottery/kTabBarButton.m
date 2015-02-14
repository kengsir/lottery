//
//  kTabBarButton.m
//  lottery
//
//  Created by Kengsir on 2/14/15.
//  Copyright (c) 2015 Kengsir. All rights reserved.
//

#import "kTabBarButton.h"

@implementation kTabBarButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

/**
 *  只要覆盖set方法，父类中的highlighted状态就会屏蔽 ， 按钮就不存在highlighted 状态
 */

-(void)setHighlighted:(BOOL)highlighted
{
    //[super setHighlighted:highlighted];
}

@end
