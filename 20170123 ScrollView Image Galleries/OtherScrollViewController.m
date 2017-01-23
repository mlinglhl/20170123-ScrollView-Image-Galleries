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
    [self.imageView setImage:[UIImage imageNamed:@"Lighthouse"]];
    self.scrollView.maximumZoomScale = 3;
    self.scrollView.minimumZoomScale = 0.1;
    UITapGestureRecognizer *tgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeView:)];
    [self.scrollView addGestureRecognizer:tgr];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

- (void) changeView: (UITapGestureRecognizer *) sender{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
