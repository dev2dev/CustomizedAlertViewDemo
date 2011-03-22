//
//  CustomizedAlertViewDemoAppDelegate.h
//  CustomizedAlertViewDemo
//
//  Created by CocoaBob on 11-3-22.
//  Copyright 2011 CocoaBob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface CustomizedAlertViewDemoAppDelegate : NSObject <UIApplicationDelegate, UIActionSheetDelegate> {
    UIWindow *window;
	
	IBOutlet UIView *mAlertViewSuperView;
	IBOutlet UIView *mAlertView;
	IBOutlet UIButton *mShowAlertButton;
	
	UIWindow *mTempFullscreenWindow;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

- (IBAction)showAlertView:(id)sender;
- (IBAction)dismissAlertView:(id)sender;

@end

