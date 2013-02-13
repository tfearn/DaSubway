//
//  DaSubwayAppDelegate.h
//  DaSubway
//
//  Created by Todd Fearn on 11/8/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DaSubwayViewController;

@interface DaSubwayAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    DaSubwayViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet DaSubwayViewController *viewController;

@end

