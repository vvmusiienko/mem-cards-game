//
//  MCMainViewController.h
//  MemCards
//
//  Created by Vania on 10.10.12.
//  Copyright (c) 2012 Vova Musiienko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCMainViewController : UIViewController
{
    
    UILabel *highScore;
    
}
@property (nonatomic,retain) IBOutlet UILabel *highScore;
-(IBAction)playButton:(id)sender;
@end
