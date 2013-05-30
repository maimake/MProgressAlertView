//
//  MProgressAlertView.m
//  MProgressAlertViewDemo
//
//  Created by mai on 13-5-29.
//  Copyright (c) 2013年 MaiMake. All rights reserved.
//

//    The MIT License (MIT)
//
//    Copyright (c) 2013 MaiMake http://www.maimake.com || https://github.com/maimake/MProgressAlertView
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy
//    of this software and associated documentation files (the "Software"), to deal
//    in the Software without restriction, including without limitation the rights
//    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//    copies of the Software, and to permit persons to whom the Software is
//    furnished to do so, subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in
//    all copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//    THE SOFTWARE.

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
        message = message ? [message stringByAppendingString:@"\n\n"] : @"\n";
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
    
    CGFloat offset = self.bounds.size.height;
    
    if (self.numberOfButtons) {//有button
        
        for(UIView* subview in self.subviews)
        {
            if ([subview isKindOfClass:NSClassFromString(@"UIAlertButton")]) {
                offset = MIN(offset, subview.frame.origin.y);
            }
        }
        
        offset -= 20;
    }else{//没有button
        offset -= 50;
    }
    
    float halfWidth = (self.bounds.size.width / 2.0);
    self.progressView.center = CGPointMake(halfWidth - 30, offset);
    self.progressLabel.center = CGPointMake(self.bounds.size.width - 50, offset);
}

@end
