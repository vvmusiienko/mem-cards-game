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

@implementation MCGameViewController

-(void)generateFieldWithCards{
    
    MCGameField *testField=[[MCGameField alloc] init];
    [testField setwidth:4 AndHeight:4];
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
    for (int row=0;row<[testField getWidth];row++){     
        if (row%2==0 && row>0 && [testField getWidth]%2==0) {
            leftSep=leftSep+ sepWidth;
            
        }
        for (int cell=0;cell<[testField getHeight];cell++){          
            
            
            if (cell%2==0 && cell>0 && [testField getHeight]%2==0) {
                topSep= topSep+ sepWidth;
                
            }
            int left = row*cellwidth +leftSep+leftPadding+padding/2;            
            int top =cell*cellhight+50+topSep+topPadding;  
            
            MCCard *card=[[MCCard alloc] initWithCardId:[testField cardIDForX:row andY:cell]];
            card.frame=CGRectMake(left, top, cellwidth-padding, cellhight-padding);
            [self.view addSubview:card];
            [card performSelector:@selector(CardFlipDown) withObject:nil afterDelay:1.0];
        }topSep=0;
        
    }
    

}

//-------------------------------------------------------------------------------------
-(void) gameLogic{
    NSString *mess = [[NSString alloc] initWithFormat:@"%i", imageCount];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hello" message:mess delegate:nil cancelButtonTitle:@"I'm awesome." otherButtonTitles:nil];
    [alert show];
     if (mayBeClicked == YES) {
       
        if (cardStatus==FALSE && lastSelCard==nil){
            [currentCard CardFlipUp];
            lastSelCard = currentCard;
        } else if (cardStatus==FALSE && lastSelCard!=nil && lastSelCard->frontImageView.tag!=currentCard->frontImageView.tag){
            [currentCard CardFlipUp];
            mayBeClicked = NO;
            [lastSelCard performSelector:@selector(CardFlipDown) withObject:nil afterDelay:1];
            [currentCard performSelector:@selector(CardFlipDown) withObject:nil afterDelay:1];
            lastSelCard=nil;
            currentCard=nil;
        } else if (cardStatus==FALSE && lastSelCard->frontImageView.tag==currentCard->frontImageView.tag){
            mayBeClicked = NO;
            [currentCard CardFlipUp];
            imageCount-=2;
            [currentCard performSelector:@selector(hideImage) withObject:nil afterDelay:1];
            [lastSelCard performSelector:@selector(hideImage) withObject:nil afterDelay:1];
            lastSelCard=nil;
            currentCard=nil;
            if (imageCount==0) {
                //go to LevelEndView
                
            }
        }
        
    }
}
-(void) changeCardStatus{
    if (cardStatus == TRUE) {
        cardStatus = FALSE;
    } else {
        cardStatus = TRUE;
    }
}
-(void) mayBeClickedMethod{
    mayBeClicked = YES;
}
-(void) imageCountPlusPlus{
    imageCount++;
}
/*-(void) currentCardEqualSelf: (UIView *) current{
    currentCard = current;
    [currentCard setHidden:YES];
}*/

//----------------------------------------------------------------------------------------------


- (IBAction)mainMenuTapped:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
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
    imageCount=0;
    i=0;j=0;
    
    [super viewDidLoad];
    [self generateFieldWithCards];
    NSString *mess = [[NSString alloc] initWithFormat:@"%i", imageCount];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hello" message:mess delegate:nil cancelButtonTitle:@"I'm awesome." otherButtonTitles:nil];
    [alert show];
	[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(showActivity) userInfo: nil repeats:YES];
    
    /*--------------------------------------------------------------------------------------*/
    NSString *defaultPath = [[NSBundle mainBundle] pathForResource:@"Levels.plist" ofType:nil];
    plistWithLevels= [NSArray arrayWithContentsOfFile:defaultPath];
    NSLog(@"%@",plistWithLevels );
    }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
