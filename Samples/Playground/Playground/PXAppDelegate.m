//
//  PXAppDelegate.m
//  Playground
//
//  Created by Paul Colton on 10/23/12.
//  Copyright (c) 2012 Pixate, Inc. All rights reserved.
//

#import "PXAppDelegate.h"
#import "PXViewController.h"
#import <Pixate/Pixate.h>
#import "iConsole.h"
#import "iNotify.h"
#import "../../License.h"

@implementation PXAppDelegate

+ (void)initialize
{
#ifndef DEBUG
	//configure iNotify
	[iNotify sharedInstance].notificationsPlistURL = @"http://www.pixate.com/inotify/playground/notifications.plist";
#endif
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[iConsoleWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    // Override point for customization after application launch.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self.viewController = [[PXViewController alloc] initWithNibName:@"PXViewController_iPhone" bundle:nil];
    } else {
        self.viewController = [[PXViewController alloc] initWithNibName:@"PXViewController_iPad" bundle:nil];
    }
    self.window.rootViewController = self.viewController;

    // Place our version number in the settings bundle
    NSString *version = [NSString stringWithFormat:@"%@",
                         [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]];
    [[NSUserDefaults standardUserDefaults] setValue:version forKey:@"playground_version"];

    [Pixate licenseKey:@PX_LICENSE_KEY forUser:@PX_LICENSE_USER];

    [self.window makeKeyAndVisible];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
