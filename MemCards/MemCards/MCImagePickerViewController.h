//
//  MCImagePickerViewController.h
//  MemCards
//
//  Created by bogash on 30.10.12.
//  Copyright (c) 2012 Vova Musiienko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCAppDelegate.h"
#import <MessageUI/MessageUI.h>
@interface MCImagePickerViewController : UIViewController <UINavigationControllerDelegate> {
	UIImageView * imageView;
	UIButton * photoLibrary;
	UIButton * standardIcons;
    UIView *mainViev;
    NSString *icon_name;
    UIPopoverController *popover;
    IBOutlet UIScrollView *mscrollview;
  
}

@property (nonatomic, retain) IBOutlet UIImageView * imageView;
@property (nonatomic, retain) IBOutlet UIButton * photoLibrary;
@property (nonatomic, retain) IBOutlet UIButton * standardIcons;
@property (nonatomic, retain) IBOutlet  UIView *mainViev;
@property(nonatomic, retain)IBOutlet UIScrollView *mscrollview;

-(IBAction) getFromPhotoLibrary :(id) sender;
-(IBAction) getStandartIcons:(id) sender;
-(IBAction) goBack:(id) sender;
-(IBAction)iconClicked:(id)sender ;

@end

