//
//  ScrollViewController.m
//  20170123 ScrollView Image Galleries
//
//  Created by Minhung Ling on 2017-01-23.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import "ScrollViewController.h"

@interface ScrollViewController ()

@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.delegate = self;
    
    for (UIImage *image in self.imageArray) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        CGRect frame = CGRectMake(self.view.frame.size.width * self.imageIndex, self.view.frame.origin.y, self.view.bounds.size.width, self.view.bounds.size.height);
        [imageView setFrame:frame];
    }
    
    UIImageView *image1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse"]];
    CGRect frame1 = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    image1.frame = frame1;
    self.imageview = image1;
    [self.scrollView addSubview:image1];
    UIImageView *image2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-in-Field"]];
    CGRect frame2 = CGRectMake(self.view.frame.size.width, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
    image2.frame = frame2;
    [self.scrollView addSubview:image2];
    UIImageView *image3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-night"]];
    CGRect frame3 = CGRectMake(self.view.frame.size.width*2, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
    image3.frame = frame3;
    [self.scrollView addSubview:image3];
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width*3, self.view.frame.size.height);
    self.scrollView.pagingEnabled = YES;
    UITapGestureRecognizer *tgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeView:)];
    [self.scrollView addGestureRecognizer:tgr];
    CGRect frame4 = CGRectMake(0, self.view.frame.size.height-50, self.view.frame.size.width, 50);
    self.pageControl = [[UIPageControl alloc]initWithFrame:frame4];
    [self.view addSubview:self.pageControl];
    self.pageControl.currentPage = 0;
    self.pageControl.numberOfPages = 3;
    [self.scrollView setContentOffset:CGPointMake(0, 68)];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _imageArray = @[
                        [UIImage imageNamed:@"Lighthouse"],
                        [UIImage imageNamed:@"Lighthouse-in-Field"],
                        [UIImage imageNamed:@"Lighthouse-night"]
                        ];
        _imageIndex = 0;
    }
    return self;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    int page = round(self.scrollView.contentOffset.x/self.view.frame.size.width);
    self.pageControl.currentPage = page;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) changeView: (UITapGestureRecognizer *) sender {
    [self.navigationController pushViewController: [self.storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"] animated:YES];
}

@end
