//
//  CustomizedAlertViewDemoAppDelegate.m
//  CustomizedAlertViewDemo
//
//  Created by CocoaBob on 11-3-22.
//  Copyright 2011 CocoaBob. All rights reserved.
//

#import "CustomizedAlertViewDemoAppDelegate.h"

@implementation CustomizedAlertViewDemoAppDelegate

@synthesize window;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	
	[mShowAlertButton setBackgroundImage:[[UIImage imageNamed:@"button_white"] stretchableImageWithLeftCapWidth:6.0 topCapHeight:6.0] forState:UIControlStateNormal];
	[mShowAlertButton setBackgroundImage:[[UIImage imageNamed:@"button_white_highlight"] stretchableImageWithLeftCapWidth:6.0 topCapHeight:6.0] forState:UIControlStateHighlighted];
	
	UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"alert-view-bg-portrait"] stretchableImageWithLeftCapWidth:142 topCapHeight:31]];
	[backgroundView setFrame:mAlertView.bounds];
	[mAlertView insertSubview:backgroundView atIndex:0];
	
	[self.window makeKeyAndVisible];
    return YES;
}

- (void)dealloc {
    [window release];
    [super dealloc];
}

#pragma mark animations

static CGFloat kTransitionDuration = 0.3f;

- (CGAffineTransform)transformForOrientation {
	UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
	if (orientation == UIInterfaceOrientationLandscapeLeft) {
		return CGAffineTransformMakeRotation(M_PI*1.5);
	} else if (orientation == UIInterfaceOrientationLandscapeRight) {
		return CGAffineTransformMakeRotation(M_PI/2);
	} else if (orientation == UIInterfaceOrientationPortraitUpsideDown) {
		return CGAffineTransformMakeRotation(-M_PI);
	} else {
		return CGAffineTransformIdentity;
	}
}

- (void)bounce2AnimationStopped{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:kTransitionDuration/2];
	mAlertView.transform = [self transformForOrientation];
	[UIView commitAnimations];
}

- (void)bounce1AnimationStopped{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:kTransitionDuration/2];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(bounce2AnimationStopped)];
	mAlertView.transform = CGAffineTransformScale([self transformForOrientation], 0.9, 0.9);
	[UIView commitAnimations];
}

#pragma mark IBAction

- (IBAction)showAlertView:(id)sender{
	[mAlertWindow setWindowLevel:UIWindowLevelAlert];
	[mAlertWindow makeKeyAndVisible];
	mAlertView.transform = CGAffineTransformScale([self transformForOrientation], 0.001, 0.001);
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:kTransitionDuration/1.5];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(bounce1AnimationStopped)];
	mAlertView.transform = CGAffineTransformScale([self transformForOrientation], 1.1, 1.1);
	[UIView commitAnimations];
}

- (IBAction)dismissAlertView:(id)sender{
	[mAlertWindow resignKeyWindow];
}


@end
