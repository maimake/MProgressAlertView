//
//  MProgressAlertView.m
//  MProgressAlertViewDemo
//
//  Created by mai on 13-5-29.
//  Copyright (c) 2013年 MaiMake. All rights reserved.
//

#import "MProgressAlertView.h"

@implementation MProgressAlertView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(id)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...
{
    //super init
    if(!(!cancelButtonTitle && !otherButtonTitles))//有button
        message = [message stringByAppendingString:@"\n\n"];
    self = [super initWithTitle:title message:message delegate:delegate cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles, nil];
    
    va_list args_list;
    va_start(args_list, otherButtonTitles);
    
    NSString* anArg;
    while((anArg = va_arg(args_list, NSString*)))
    {
        [self addButtonWithTitle:anArg];
    }
    
    va_end(args_list);
    
    
    // add progress view
    self.progressView = [[[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar] autorelease];
    self.progressView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [self addSubview:self.progressView];
    
    // add progress view
    self.progressLabel = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 70, 30)] autorelease];
    self.progressLabel.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    self.progressLabel.backgroundColor = [UIColor clearColor];//comment it to look label's position
    self.progressLabel.textColor = [UIColor whiteColor];
    self.progressLabel.textAlignment = NSTextAlignmentCenter;
    self.progressLabel.adjustsFontSizeToFitWidth = YES;
    [self addSubview:self.progressLabel];
    
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


-(void)layoutSubviews
{
    [super layoutSubviews];
    int idxLabel = 0;
    for(UIView* subview in self.subviews)
    {
        if ([subview isKindOfClass:[UILabel class]]) {
            if(++idxLabel == 2)//message label
            {
                float halfWidth = (self.bounds.size.width / 2.0);
                if (self.numberOfButtons) {//有button
                    self.progressView.center = CGPointMake(halfWidth - 30, CGRectGetMaxY(subview.frame));
                    self.progressLabel.center = CGPointMake(self.bounds.size.width - 50, CGRectGetMaxY(subview.frame));
                } else {//没button
                    self.progressView.center = CGPointMake(halfWidth - 30, CGRectGetMaxY(subview.frame) + 25);
                    self.progressLabel.center = CGPointMake(self.bounds.size.width - 50, CGRectGetMaxY(subview.frame) + 25);
                }
            }
            if(idxLabel >= 2)
                break;
        }
    }
}

@end
