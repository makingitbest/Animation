//
//  ViewController.m
//  Animation
//
//  Created by WangQiao on 16/9/12.
//  Copyright © 2016年 WangQiao. All rights reserved.
//

#import "ViewController.h"
#import "UIView+SetRect.h"
#import "UIImage+ImageEffects.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *animationView;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.animationView                   = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.animationView.backgroundColor   = [UIColor redColor];
    self.animationView.layer.borderWidth = 1;
    self.animationView.center            = self.view.center;
    [self.view addSubview:self.animationView];
    
    // 移动位置
//    [self performSelector:@selector(movePosition) withObject:nil afterDelay:2.0f];
    
    // 改变透明度
//    [self performSelector:@selector(changeAlpha) withObject:nil afterDelay:1.0f];

    // 改变透明度和位置
//    [self performSelector:@selector(changePositionAndAlpha) withObject:nil afterDelay:2.0f];
    
    // 放大缩小 改变透明度  颜色
//    [self performSelector:@selector(scaleAnimation) withObject:nil afterDelay:2.0f];
    
    // 图片的模糊处理
    [self performSelector:@selector(scaleImageViewAnimation) withObject:nil afterDelay:2.0f];
}

- (void)scaleImageViewAnimation {

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.image        = [UIImage imageNamed:@"黑夜"];
    imageView.contentMode  = UIViewContentModeScaleAspectFill;
    [self.view addSubview:imageView];
    
    UIImageView *blurView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    blurView.image        = [[UIImage imageNamed:@"黑夜"] blurImage];
    blurView.contentMode  = UIViewContentModeScaleAspectFill;
    blurView.alpha        = 0.f;
    [self.view addSubview:blurView];
    
    [UIView animateWithDuration:6.0f delay:0 options:UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse  animations:^{
        
        imageView.transform = CGAffineTransformMakeScale(1.5, 1.5);
        blurView.transform  = CGAffineTransformMakeScale(1.5, 1.5);
        
        blurView.alpha = 1.0f;
        
    } completion:^(BOOL finished) {
        
    }];
}

- (void)scaleAnimation {

    [UIView animateWithDuration:3.0f animations:^{
        
        self.animationView.alpha = 0;
        self.animationView.x    += 100;
        self.animationView.y    += 100;
        self.animationView.backgroundColor = [UIColor greenColor];
        self.animationView.transform = CGAffineTransformMakeScale(2, 2);
        
    } completion:^(BOOL finished) {
       
        [UIView animateWithDuration:2.0f animations:^{
            
            self.animationView.alpha = 1;
            self.animationView.x    -= 100;
            self.animationView.y    -= 100;
            self.animationView.backgroundColor = [UIColor redColor];
            self.animationView.transform = CGAffineTransformMakeScale(1, 1);
        }];
    }];
}

- (void)changePositionAndAlpha {

    [UIView animateWithDuration:2.0f animations:^{
        
        self.animationView.x += 100;
        self.animationView.y += 100;
        self.animationView.alpha = 0.f;
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:2.0f animations:^{
           
            self.animationView.x -= 100;
            self.animationView.y -= 100;
            self.animationView.alpha = 1.0f;
        }];
    }];
    
}

- (void)changeAlpha {

    [UIView animateWithDuration:2.0f animations:^{
        
        self.animationView.alpha = 0;
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:2.0f animations:^{
            
            self.animationView.alpha = 1;
        }];
    }];
}

- (void)movePosition {
    
    [UIView animateWithDuration:2.0f animations:^{
        
        self.animationView.x += 100;
        self.animationView.y += 100;
    }];
}

@end
