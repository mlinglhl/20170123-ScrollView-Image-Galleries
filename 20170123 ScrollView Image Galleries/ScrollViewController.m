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
    self.title = @"Navigation View";
    self.scrollView.delegate = self;
    
    for (UIImage *image in self.imageArray) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        CGRect frame = CGRectMake(self.view.frame.size.width * self.imageIndex, self.view.frame.origin.y, self.view.bounds.size.width, self.view.bounds.size.height);
        imageView.frame = frame;
        [self.scrollView addSubview:imageView];
        self.imageIndex++;
    }
    [self setUpScrollView];
    [self setUpPageControl];
    self.imageIndex = 0;
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

- (void) setUpScrollView {
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width*self.imageArray.count, self.view.frame.size.height);
    self.scrollView.pagingEnabled = YES;
    UITapGestureRecognizer *tgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeView:)];
    [self.scrollView addGestureRecognizer:tgr];
    [self.scrollView setContentOffset:CGPointMake(0, 64)];
}

- (void) setUpPageControl {
    CGRect frame4 = CGRectMake(0, self.view.frame.size.height-50, self.view.frame.size.width, 50);
    self.pageControl = [[UIPageControl alloc]initWithFrame:frame4];
    [self.view addSubview:self.pageControl];
    self.pageControl.currentPage = 0;
    self.pageControl.numberOfPages = 3;
    UITapGestureRecognizer *tgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nextPage)];
    [self.pageControl addGestureRecognizer:tgr];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    int page = round(self.scrollView.contentOffset.x/self.view.frame.size.width);
    self.pageControl.currentPage = page;
    self.imageIndex = page;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) changeView: (UITapGestureRecognizer *) sender {
    OtherScrollViewController *sv = [self.storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
    sv.image = self.imageArray[self.imageIndex];
    [self.navigationController pushViewController:sv animated:NO];
}

- (void) nextPage {
    if (self.imageIndex == self.imageArray.count -1) {
        self.imageIndex = 0;
    }
    else {
        self.imageIndex++;
    }
    [self.scrollView setContentOffset:CGPointMake(self.view.bounds.size.width*self.imageIndex, 0)];
}

@end
