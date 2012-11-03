//
//  MCMainViewController.m
//  MemCards
//
//  Created by Vania on 10.10.12.
//  Copyright (c) 2012 Vova Musiienko. All rights reserved.
//

#import "MCMainViewController.h"
#import "MCGameField.h"


@interface MCMainViewController ()

@end

@implementation MCMainViewController
@synthesize highScore;
-(IBAction)playButton:(id)sender{
    
    [highScore setText:@"0"];

}

-(IBAction)showLeader{
    GKLeaderboardViewController *leaderboardController = [[GKLeaderboardViewController alloc] init];
    if (leaderboardController != nil) {
        leaderboardController.leaderboardDelegate = self;
        [self presentViewController:leaderboardController animated:YES completion:NULL];
    }
}

-(void)leaderboardViewControllerDidFinish: (GKLeaderboardViewController *)viewController{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)email:(id)sender {
    MFMailComposeViewController *mailComposer = [[MFMailComposeViewController alloc] init];
    mailComposer.mailComposeDelegate=self;
    NSArray *emailAddresses = [[NSArray alloc] initWithObjects:@"me@company.com", nil];
    NSString *sendSubject = [[NSString alloc] initWithFormat:@"Memmory Game"];
    NSString *sendMessage = [[NSString alloc] initWithFormat:@"Hi! Checkout this cool game bro!"];
    
    [mailComposer setToRecipients:emailAddresses];
    [mailComposer setSubject:sendSubject];
    [mailComposer setMessageBody:sendMessage isHTML:NO];
    [self presentViewController:mailComposer animated:YES completion:NULL];
}
-(void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

//==============================FaceBook==============================
- (IBAction)shareHSFacebookButton {
    MCAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    if (FBSession.activeSession.isOpen) {
    } else {
        [appDelegate openSessionWithAllowLoginUI:YES];
    }

    NSString *message = [NSString stringWithFormat:@"Hi guys! Checkout my new highscore in MemCards Game! %@", highScore.text];
    BOOL displayedNativeDialog = [FBNativeDialogs presentShareDialogModallyFrom:self
                                                                    initialText:nil
                                                                          image:nil
                                                                            url:nil
                                                                        handler:nil];
    if (!displayedNativeDialog) {
        [self performPublishAction:^{
            [FBRequestConnection startForPostStatusUpdate:message
                                        completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
                                            [self showAlert:message error:error];
                                        }];
        }];
    }
}
- (void) performPublishAction:(void (^)(void)) action {
    if ([FBSession.activeSession.permissions indexOfObject:@"publish_actions"] == NSNotFound) {
        [FBSession.activeSession reauthorizeWithPublishPermissions:[NSArray arrayWithObject:@"publish_actions"]
                                                   defaultAudience:FBSessionDefaultAudienceFriends
                                                 completionHandler:^(FBSession *session, NSError *error) {
                                                     if (!error) {
                                                         action();
                                                     }
                                                 }];
    } else {
        action();
    }
    
}
- (void)showAlert:(NSString *)message
            error:(NSError *)error {
    NSString *alertMsg;
    NSString *alertTitle;
    if (error) {
        alertMsg = error.localizedDescription;
        alertTitle = @"Error";
    } else {
        alertMsg = [NSString stringWithFormat:@"Successfully posted '%@'",
                    message];
        alertTitle = @"Success";
    }
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:alertTitle
                                                        message:alertMsg
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    [alertView show];
}
- (void) alertView:(UIAlertView *)alertView
didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [[self presentingViewController]
     dismissModalViewControllerAnimated:YES];
}
//==============================FaceBook==============================end

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    MCAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [appDelegate openSessionWithAllowLoginUI:NO];


	// Do any additional setup after loading the view.

    // Check the session for a cached token to show the proper authenticated
    // UI. However, since this is not user intitiated, do not show the login UX.
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
