/*
 The MIT License (MIT)
 Copyright (c) 2013 iDATA Corporation
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */


#import "DaSubwayViewController.h"

@implementation DaSubwayViewController
@synthesize scrollView;
@synthesize imageView;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    
    float zoomScale = 0.50;
    CGPoint contentOffset = CGPointMake(75, 500);
    
    NSString *contentOffsetX = [[NSUserDefaults standardUserDefaults] stringForKey:@"content_offset_x"];
    if(contentOffsetX != nil)
       contentOffset.x = [contentOffsetX floatValue];
    NSString *contentOffsetY = [[NSUserDefaults standardUserDefaults] stringForKey:@"content_offset_y"];
    if(contentOffsetY != nil)
        contentOffset.y = [contentOffsetY floatValue];
    NSString *zoomScaleS = [[NSUserDefaults standardUserDefaults] stringForKey:@"zoom_scale"];
    if(zoomScaleS != nil)
        zoomScale = [zoomScaleS floatValue];
	
	self.scrollView.minimumZoomScale=0.20;
    self.scrollView.maximumZoomScale=2.0;
	self.scrollView.contentSize = CGSizeMake(2479, 2994);
    self.scrollView.delegate=self;
	self.scrollView.clipsToBounds = YES;
	self.scrollView.zoomScale= zoomScale;

	[scrollView setContentOffset:contentOffset animated:YES];
	
    // Listen for Double Tap Zoom
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
    [doubleTap setNumberOfTapsRequired:2];
    [self.scrollView addGestureRecognizer:doubleTap];
    [doubleTap release];
    
    [super viewDidLoad];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return YES;
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
}


- (void)dealloc {
	[scrollView release];
	[imageView release];
	
    [super dealloc];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

- (void)handleDoubleTap:(UIGestureRecognizer *)recognizer {
    float zoomScale = self.scrollView.zoomScale;
    if(zoomScale != 2.0)
        [self.scrollView setZoomScale:2.0 animated:YES];
    else
        [self.scrollView setZoomScale:0.5 animated:YES];
}

- (void)saveImageSettings {
    CGPoint contentOffset = [self.scrollView contentOffset];
    float zoomScale = self.scrollView.zoomScale;
    
    [[NSUserDefaults standardUserDefaults] setValue:[NSString stringWithFormat:@"%f", contentOffset.x] forKey:@"content_offset_x"];
    [[NSUserDefaults standardUserDefaults] setValue:[NSString stringWithFormat:@"%f", contentOffset.y] forKey:@"content_offset_y"];
    [[NSUserDefaults standardUserDefaults] setValue:[NSString stringWithFormat:@"%f", zoomScale] forKey:@"zoom_scale"];
}

@end
