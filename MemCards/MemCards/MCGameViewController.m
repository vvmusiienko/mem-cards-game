//
//  MCGameViewController.m
//  MemCards
//
//  Created by Guest on 15.10.12.
//  Copyright (c) 2012 Vova Musiienko. All rights reserved.
//

#import "MCGameViewController.h"
#import "MCGameField.h"
#import "MCCard.h"
#import "MCLevelEndViewController.h"
@interface MCGameViewController ()
{
    int fieldWidth;
    int fieldHeight;
}
@end

@implementation MCGameViewController

-(void)generateFieldWithCards{
    
     MCGameField *testField=[[MCGameField alloc] init];
    [testField setwidth:[[currentLevelSettings objectAtIndex:2] intValue] AndHeight:[[currentLevelSettings objectAtIndex:3] intValue]];
    [testField generateRandomField]; 
    
    int sepWidth=10;
    int padding=4;
    int separateX=([testField getWidth]/2-1)*sepWidth;
    int separateY=([testField getHeight]/2-1)*sepWidth;
    int cellwidth= (320-separateX)/[testField getWidth];
    int cellhight= (350-separateY)/[testField getHeight];
    int leftPadding=((320 -separateX)- cellwidth*[testField getWidth])/2;
    int topPadding=((350 -separateY)- cellhight*[testField getHeight])/2;
   
    int topSep=0;
    int leftSep=0;
    f = 0;
    
    for (int row=0; row<[testField getWidth];row++){
        if (row%2==0 && row>0 && [testField getWidth]%2==0) {
            leftSep=leftSep+ sepWidth;
            
        }
        for (int cell=0;cell<[testField getHeight];cell++){          
            
            
            if (cell%2==0 && cell>0 && [testField getHeight]%2==0) {
                topSep= topSep+ sepWidth;
                
            }
            int left = row*cellwidth +leftSep+leftPadding+padding/2;
            int top =cell*cellhight+50+topSep+topPadding;
            
            float firstPointX = 400*cos(f)+120;
            float firstPointY = 400*sin(f)+230;
            
            MCCard *card=[[MCCard alloc] initWithCardId:[testField cardIDForX:row andY:cell]];
            
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:3];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
            [UIView setAnimationBeginsFromCurrentState:YES];
            CGAffineTransform transform = CGAffineTransformMakeRotation(-0.0f);
            
            card.frame = CGRectMake(firstPointX,firstPointY, 0, 0);
            card.transform = CGAffineTransformMakeRotation(360.0f);
            [self.view addSubview:card];
            
            card.transform =transform;
            card.frame = CGRectMake(left,top, cellwidth-padding, cellhight-padding);
            f=f+360/(row*cell+1);
            [UIView commitAnimations];
            
            [card performSelector:@selector(CardFlipDown) withObject:nil afterDelay:4];
            card.delegate = self;
            imageCount++;
            cardsMayBeClicked = YES;
            imageCount++;
        }topSep=0;
    }
}
//-------------------------------------------------------------------------------------
-(void)cardClicked:(MCCard*) cardSelf {
    currentCard = cardSelf;
    if (cardsMayBeClicked == YES) {
        if ([currentCard getCardIsFleppedUp]==NO && lastSelCard==nil){
            [currentCard CardFlipUp];
            lastSelCard = currentCard;
        } else if ([currentCard getCardIsFleppedUp]==NO && lastSelCard!=nil && [lastSelCard getIdForCard] != [currentCard getIdForCard]){
            cardsMayBeClicked = NO;
            [currentCard CardFlipUp];
            [lastSelCard performSelector:@selector(CardFlipDown) withObject:nil afterDelay:1];
            [currentCard performSelector:@selector(CardFlipDown) withObject:nil afterDelay:1];
            [self performSelector:@selector(cardsMayBeClickedIsEqualYes) withObject:nil afterDelay:1];
            lastSelCard=nil;
            currentCard=nil;
        } else if ([currentCard getCardIsFleppedUp]==NO && [lastSelCard getIdForCard] == [currentCard getIdForCard]){
            cardsMayBeClicked = NO;
            [currentCard CardFlipUp];
            imageCount-=2;
            [currentCard performSelector:@selector(hideImage) withObject:nil afterDelay:1];
            [lastSelCard performSelector:@selector(hideImage) withObject:nil afterDelay:1];
            [self performSelector:@selector(cardsMayBeClickedIsEqualYes) withObject:nil afterDelay:1];
            lastSelCard=nil;
            currentCard=nil;
            if (imageCount==0) {
                
                    if (levelId<6) {
                        //go to LevelEndView
                        [self performSegueWithIdentifier:@"timer" sender:self];
                   
                }   else [self performSegueWithIdentifier:@"GameEnd" sender:self];
                
            }
        }
    }
}
-(void) cardsMayBeClickedIsEqualYes{
    cardsMayBeClicked = YES;
}
//----------------------------------------------------------------------------------------------

- (IBAction)mainMenuTapped:(id)sender {
    //[self dismissModalViewControllerAnimated:YES];
  //  levelId=0;
}



-(void)showActivity{
    i = [myTimer.text intValue];
    j = [myScore.text intValue];
    
    int newTime = i + 1;
	
    myTimer.text = [NSString stringWithFormat:@"%d", newTime];
    myScore.text=[NSString stringWithFormat:@"%d",j];
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
    NSString *defaultPath = [[NSBundle mainBundle] pathForResource:@"Levels.plist" ofType:nil];
    plistWithLevels= [NSArray arrayWithContentsOfFile:defaultPath];
    NSLog(@"%@",plistWithLevels );
    currentLevelSettings=[plistWithLevels objectAtIndex:levelId];
    imageCount=0;
    i=0;j=0;
    
    [super viewDidLoad];
    [self generateFieldWithCards];

	[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(showActivity) userInfo: nil repeats:YES];
   
    /*--------------------------------------------------------------------------------------*/
 }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
