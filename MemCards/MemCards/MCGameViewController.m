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
@interface MCGameViewController ()

@end

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
            
        }topSep=0;
        
    }
    
    /*
     if (row%2==0 ) {
     MCCard *card=[[MCCard alloc] initWithCardId:8];
     card.frame=CGRectMake(160, 0, 6, 460);
     [self.view addSubview:card];
     row--;
     }else{
     
     if (cell%2==0) {
     MCCard *card1=[[MCCard alloc] initWithCardId:8];
     card1.frame=CGRectMake(0, 215, 320, 6);
     [self.view addSubview:card1];
     cell--;
     
     }else{ 
     */
    
    
}

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
    
    i=0;j=0;
    
    [super viewDidLoad];
    [self generateFieldWithCards];
    
	[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(showActivity) userInfo: nil repeats:YES];
    
    /*--------------------------------------------------------------------------------------*/
    NSString *defaultPath = [[NSBundle mainBundle] pathForResource:@"Plist.plist" ofType:nil];
    plistWithLevels= [NSArray arrayWithContentsOfFile:defaultPath];
    NSLog(@"%@",plistWithLevels );
    }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
