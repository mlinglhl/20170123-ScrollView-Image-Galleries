//
//  OtherScrollViewController.h
//  20170123 ScrollView Image Galleries
//
//  Created by Minhung Ling on 2017-01-23.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OtherScrollViewController : UIViewController <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property UIView *map;
@property UIView *mapReference;
@property UIImage *image;

@end
