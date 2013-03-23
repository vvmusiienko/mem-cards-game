//
//  MCMainViewController.h
//  MemCards
//
//  Created by Vania on 10.10.12.
//  Copyright (c) 2012 Vova Musiienko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MessageUI/MessageUI.h>
#import "MCSoundSystem.h"
#import "MCAppDelegate.h"

@interface MCMainViewController : UIViewController
{
    UILabel *highScore;
    UIView *shareWith;
}

@property (nonatomic,retain) IBOutlet UILabel *highScore;
@property (nonatomic,retain) IBOutlet UIView *shareWith;
@end

@interface ViewController : UIViewController
<MFMailComposeViewControllerDelegate>

-(IBAction)email:(id)sender;

-(IBAction)playButton:(id)sender;

-(IBAction)showLeader;

@end