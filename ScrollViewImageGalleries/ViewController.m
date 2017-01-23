//
//  ViewController.m
//  ScrollViewImageGalleries
//
//  Created by Pierre Binon on 2017-01-23.
//  Copyright © 2017 Pierre Binon. All rights reserved.
//

#import "ViewController.h"




@interface ViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) NSArray<UIImage*>* lighthouseImages;

@end






@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.lighthouseImages = @[[UIImage imageNamed:@"Lighthouse-in-Field"],
                         [UIImage imageNamed:@"Lighthouse-night"],
                         [UIImage imageNamed:@"Lighthouse"]];
}


- (void) viewWillAppear:(BOOL)animated {
    [self setUpScrollViewForLighthouse];
}


- (void)setUpScrollViewForLighthouse {
    CGRect viewRect = self.view.bounds;
    CGFloat imageX = 0;
    // Make an uiimageview for each phone image
    for (UIImage *lighthouseImage in self.lighthouseImages) {
        // Create image view with image
        UIImageView *imgView = [[UIImageView alloc] initWithImage:lighthouseImage];
        // Set it to scale reasonably so images don't get distorted
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        // Frame = size of the view, moved 0 on x-axis & imageY on y-axis
        CGRect imgFrame = CGRectOffset(viewRect, imageX, 0);
        imgView.frame = imgFrame;
        // Increase imageY by the height of one view, so next view is below this one
        imageX += CGRectGetWidth(viewRect);
        // Add each as a subview of the scrollview
        [self.scrollView addSubview:imgView];
    }
    // Make scrollview move in discrete pages
    self.scrollView.pagingEnabled = YES;
    // Set the content size of the scrollview
    self.scrollView.contentSize = CGSizeMake(CGRectGetHeight(viewRect) * self.lighthouseImages.count,
                                             CGRectGetWidth(viewRect));
    
    [self.scrollView setTranslatesAutoresizingMaskIntoConstraints: YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
