//
//  MCAppDelegate.h
//  MemCards
//
//  Created by Vova Musiienko on 28.09.12.
//  Copyright (c) 2012 Vova Musiienko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
extern NSString *const FBSessionStateChangedNotification;
@interface MCAppDelegate : UIResponder <UIApplicationDelegate>
{
    
}
- (BOOL)openSessionWithAllowLoginUI:(BOOL)allowLoginUI;
@property (strong, nonatomic) UIWindow *window;

@end
