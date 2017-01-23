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
    UIImageView *image1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse"]];
    image1.frame = self.view.frame;
    [self.scrollView addSubview:image1];
    UIImageView *image2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-in-Field"]];
    CGRect frame2 = CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
    image2.frame = frame2;
    [self.scrollView addSubview:image2];
    UIImageView *image3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-night"]];
    CGRect frame3 = CGRectMake(self.view.frame.size.width*2, 0, self.view.frame.size.width, self.view.frame.size.height);
    image3.frame = frame3;
    [self.scrollView addSubview:image3];
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width*3, self.view.frame.size.height);
    self.scrollView.pagingEnabled = YES;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
