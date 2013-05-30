//
//  MViewController.m
//  MProgressAlertViewDemo
//
//  Created by mai on 13-5-29.
//  Copyright (c) 2013年 MaiMake. All rights reserved.
//

#import "MViewController.h"
#import "MProgressAlertView.h"

@interface MViewController ()
@property (nonatomic, retain) MProgressAlertView* progressAlertView;
@property (nonatomic, retain) NSTimer* timer;
-(void) onTimer:(id)sender;

@end

@implementation MViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onAlert:(UIButton*)sender {
    
    NSTimeInterval interval = (sender.tag % 2) ? 0.03f : 0.1f;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(onTimer:) userInfo:nil repeats:YES];
    
    NSString* title = @"Title";
    NSString* message = @"message message message message !";
    
    switch (sender.tag) {
        case 1:
            self.progressAlertView = [[[MProgressAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil] autorelease];
            break;
        case 2:
            self.progressAlertView = [[[MProgressAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil] autorelease];
            break;
        case 3:
            self.progressAlertView = [[[MProgressAlertView alloc] initWithTitle:title message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil] autorelease];
            break;
        case 4:
            self.progressAlertView = [[[MProgressAlertView alloc] initWithTitle:title message:nil delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"Button 1", @"Button 2", @"Button 3", nil] autorelease];
            break;
        case 5:
            self.progressAlertView = [[[MProgressAlertView alloc] initWithTitle:nil message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil] autorelease];
            break;
        case 6:
            self.progressAlertView = [[[MProgressAlertView alloc] initWithTitle:nil message:message delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil] autorelease];
            break;
        case 7:
            self.progressAlertView = [[[MProgressAlertView alloc] initWithTitle:nil message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil] autorelease];
            break;
        case 8:
            self.progressAlertView = [[[MProgressAlertView alloc] initWithTitle:nil message:nil delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil] autorelease];
            break;
    }
    self.progressAlertView.delegate = self;
    [self.progressAlertView show];
}

-(void)onTimer:(NSTimer*)sender
{
    self.progressAlertView.progressView.progress += 0.01f;
    self.progressAlertView.progressLabel.text = [NSString stringWithFormat:@"%d%%", (int)(self.progressAlertView.progressView.progress * 100)];
    if (self.progressAlertView.progressView.progress >= 1) {
        [self.progressAlertView dismissWithClickedButtonIndex:-1 animated:YES];
    }
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self.timer invalidate];
    self.timer = nil;
    self.progressAlertView = nil;
}

@end
