//
//  LSAppDelegate.m
//  LockScreen
//
//  Created by Brian Turner on 12/25/12.
//  Copyright (c) 2012 Turningdevelopment. All rights reserved.
//

#import "LSAppDelegate.h"
#import "LSTestScreenViewController.h"
#import "LSPassword.h"
#import "LSPasswordCharacter.h"

@implementation LSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    LSPassword *_masterPassword = [[LSPassword alloc] init];
    [_masterPassword addPasswordCharacter:[LSPasswordCharacter characterWithCharacterColor:LSPasswordCharacterColorBlue
                                                                                      size:LSPasswordCharacterSizeSmall
                                                                                     shape:LSPasswordCharacterShapeTriangle]];
    
    [_masterPassword addPasswordCharacter:[LSPasswordCharacter characterWithCharacterColor:LSPasswordCharacterColorBlue
                                                                                      size:LSPasswordCharacterSizeNone
                                                                                     shape:LSPasswordCharacterShapeTriangle]];
    
    [_masterPassword addPasswordCharacter:[LSPasswordCharacter characterWithCharacterColor:LSPasswordCharacterColorGreen
                                                                                      size:LSPasswordCharacterSizeNone
                                                                                     shape:LSPasswordCharacterShapeTriangle]];
    
    [_masterPassword addPasswordCharacter:[LSPasswordCharacter characterWithCharacterColor:LSPasswordCharacterColorGreen
                                                                                      size:LSPasswordCharacterSizeMedium
                                                                                     shape:LSPasswordCharacterShapeTriangle]];
    LSTestScreenViewController *vc = [[LSTestScreenViewController alloc] initWithMasterPassword:_masterPassword];
    [[self window] setRootViewController:vc];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
