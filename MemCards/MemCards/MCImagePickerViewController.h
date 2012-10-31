//
//  MCImagePickerViewController.h
//  MemCards
//
//  Created by bogash on 30.10.12.
//  Copyright (c) 2012 Vova Musiienko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCAppDelegate.h"
@interface MCImagePickerViewController : UIViewController <UINavigationControllerDelegate> {
	UIImageView * imageView;
	UIButton * photoLibrary;
	UIButton * standardIcons;
    UIView *mainViev;
    UIView *iconView;
    NSString *icon_name;
  
}

@property (nonatomic, retain) IBOutlet UIImageView * imageView;
@property (nonatomic, retain) IBOutlet UIButton * photoLibrary;
@property (nonatomic, retain) IBOutlet UIButton * standardIcons;
@property (nonatomic, retain) IBOutlet  UIView *mainViev;
@property (nonatomic, retain) IBOutlet  UIView *iconViev;

-(IBAction) getFromPhotoLibrary :(id) sender;
-(IBAction) getStandartIcons:(id) sender;
-(IBAction) goBack:(id) sender;
- (IBAction)iconClicked:(id)sender ;

@end

