//
//  OtherScrollViewController.m
//  20170123 ScrollView Image Galleries
//
//  Created by Minhung Ling on 2017-01-23.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import "OtherScrollViewController.h"

@interface OtherScrollViewController ()

@end

@implementation OtherScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.delegate = self;
    self.imageView.frame = self.view.bounds;
    [self.imageView setImage:self.image];
    self.scrollView.maximumZoomScale = 10;
    self.scrollView.minimumZoomScale = 1;
//    UITapGestureRecognizer *tgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeView:)];
//    [self.scrollView addGestureRecognizer:tgr];
    [self createMap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    CGFloat scale = -scrollView.pinchGestureRecognizer.scale;
    self.mapReference.transform = CGAffineTransformMakeScale(scale, scale);
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

- (void) createMap {
    CGRect frame = CGRectMake(0, 0, self.view.bounds.size.width/4, self.view.bounds.size.height/4);
    UIView *outline = [[UIView alloc] initWithFrame:frame];
    outline.alpha = 0.2;
    outline.backgroundColor = [UIColor whiteColor];
    outline.clipsToBounds = YES;
    [self.view addSubview:outline];
    UIView *reference = [[UIView alloc] initWithFrame:frame];
    reference.alpha = 1;
    reference.backgroundColor = [UIColor blueColor];
    [outline addSubview:reference];
    self.map = outline;
    self.mapReference = reference;
}

- (void) changeView: (UITapGestureRecognizer *) sender{
//    [self.navigationController popViewControllerAnimated:YES];
}

@end
