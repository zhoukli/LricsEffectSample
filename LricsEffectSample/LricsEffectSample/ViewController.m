//
//  ViewController.m
//  LricsEffectSample
//
//  Created by 周凯丽 on 2017/6/22.
//  Copyright © 2017年 t. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Frame.h"


@interface ViewController ()
{
    NSTimer *_timer;
   
    BOOL increase;
}
@property (weak, nonatomic) IBOutlet UILabel *originLabel;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UILabel *laterLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.bgView.clipsToBounds = YES;
    [self.bgView setWidth:0];

    self.originLabel.text = @"我是歌词我是歌词我是歌词";
    self.laterLabel.text = self.originLabel.text;
    self.laterLabel.textColor = [UIColor redColor];
    CGRect rect = [self.originLabel.text boundingRectWithSize:CGSizeMake(300, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: self.originLabel.font} context:nil];
    [self.originLabel setWidth:rect.size.width +1];
}
- (void)start
{
    if (self.bgView.width <= 0) {
        increase = YES;
        
    }
    if (self.bgView.width >= self.originLabel.width) {
        increase = NO;
    }
    CGFloat bgW = self.bgView.width;
    if (increase) {
        bgW += 2;
    }else{
        bgW -= 2;
    }
    [self.bgView setWidth:bgW];
    NSLog(@"%.f",self.bgView.width);
}
#pragma mark - events
- (IBAction)startButtonClick:(id)sender
{
    [_timer invalidate];
    _timer = nil;
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(start) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    
}

- (IBAction)stopButtonClick:(id)sender
{
    [_timer invalidate];
    _timer = nil;
}


@end
