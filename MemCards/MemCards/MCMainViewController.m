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
    levelId=0;
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
  
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
