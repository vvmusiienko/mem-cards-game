//
//  MCGameEndViewController.h
//  MemCards
//
//  Created by Jura on 06.10.12.
//  Copyright (c) 2012 Vova Musiienko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCGameEndViewController : UIViewController{
  
   
 
    IBOutlet UILabel *all_time;
    IBOutlet UILabel *all_scores;
 
}



-(void)setalltime:(int)alltime;

-(void)setallscores:(int)allscores;
@end