//
//  MCGameEndViewController.h
//  MemCards
//
//  Created by Jura on 06.10.12.
//  Copyright (c) 2012 Vova Musiienko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCGameEndViewController : UIViewController{
  
     UILabel *timeSpent;
     UILabel *allScores;
}

@property(nonatomic,retain) IBOutlet UILabel *timeSpent;
@property(nonatomic,retain) IBOutlet UILabel *allscores;


@end