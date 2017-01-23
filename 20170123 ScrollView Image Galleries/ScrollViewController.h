//
//  ScrollViewController.h
//  20170123 ScrollView Image Galleries
//
//  Created by Minhung Ling on 2017-01-23.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OtherScrollViewController.h"

@interface ScrollViewController : UIViewController <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property UIPageControl *pageControl;
@property UIImageView *imageview;
@property NSArray <UIImage *> *imageArray;
@property NSInteger imageIndex;

@end
