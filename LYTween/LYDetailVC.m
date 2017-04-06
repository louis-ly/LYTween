//
//  LYDetailVC.m
//  LYTween
//
//  Created by louis on 2017/4/6.
//  Copyright © 2017年 louis. All rights reserved.
//

#import "LYDetailVC.h"

@interface LYDetailVC ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentView;
@property (weak, nonatomic) IBOutlet UIView *drawView;
@property (nonatomic, strong) UIView *redPoint;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@end

@implementation LYDetailVC {
    CADisplayLink *_link;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self start];
}

static NSInteger i = 0;
- (void)start {
    if (_link) {
        [_link invalidate];
        _link = nil;
    }
    i = 0;
    _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(display)];
    [_link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)display {
    i++;
    
    CGFloat y = LYTweenWithType(_type, _segmentView.selectedSegmentIndex, i/60.0, 0, 240, _slider.value);
    
    UIView *point = [[UIView alloc] initWithFrame:CGRectMake(i*(240.0/(_slider.value*60.0)), y, 2, 2)];
    point.backgroundColor = [UIColor blackColor];
    point.layer.cornerRadius = 1;
    point.layer.masksToBounds = YES;
    [_drawView addSubview:point];
    
    self.redPoint.center = point.center;
    
    if (i >= _slider.value*60) {
        [_link invalidate];
        _link = nil;
    }
}
- (IBAction)segmentClicked:(id)sender {
    [self restart:nil];
}

- (IBAction)restart:(id)sender {
    [_drawView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [_drawView addSubview:_redPoint];
    [self start];
}

- (IBAction)sliderChanged:(UISlider *)slider {
    _timeLabel.text = [NSString stringWithFormat:@"%.2f", slider.value];
}

- (UIView *)redPoint {
    if (!_redPoint) {
        _redPoint = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
        _redPoint.backgroundColor = [UIColor redColor];
        _redPoint.layer.cornerRadius = 5;
        _redPoint.layer.masksToBounds = YES;
        [_drawView addSubview:_redPoint];
    }
    return _redPoint;
}
@end
