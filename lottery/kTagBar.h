//
//  kTagBar.h
//  lottery
//
//  Created by Kengsir on 2/14/15.
//  Copyright (c) 2015 Kengsir. All rights reserved.
//

#import <UIKit/UIKit.h>
@class kTagBar;
@protocol  kTagBarDelegate<NSObject>

@optional

-(void)tagBar : (kTagBar *)tarBar DidSelectedButtonFrom : (int )from To :(int)to;

@end

@interface kTagBar : UIView

@property (nonatomic , weak) id <kTagBarDelegate> delegate;

@end
