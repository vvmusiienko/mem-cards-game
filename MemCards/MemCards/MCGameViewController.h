//
//  MCGameViewController.h
//  MemCards
//
//  Created by Guest on 15.10.12.
//  Copyright (c) 2012 Vova Musiienko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCGameViewController : UIViewController{
    IBOutlet UILabel *myTimer;
    IBOutlet UILabel *myScore;
    
    int i,j;
}
-(void)showActivity;
@end
