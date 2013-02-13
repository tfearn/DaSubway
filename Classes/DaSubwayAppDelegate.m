//
//  DaSubwayAppDelegate.m
//  DaSubway
//
//  Created by Todd Fearn on 11/8/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DaSubwayAppDelegate.h"
#import "DaSubwayViewController.h"
#import "Flurry.h"

@implementation DaSubwayAppDelegate

@synthesize window;
@synthesize viewController;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    [Flurry startSession:@"96CC2KTV9DSJNDW95W8X"];

    // Add the view controller's view to the window and display.
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
	
	//[NSThread sleepForTimeInterval:1.0];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    [viewController saveImageSettings];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
}


- (void)applicationWillTerminate:(UIApplication *)application {
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
}

- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
