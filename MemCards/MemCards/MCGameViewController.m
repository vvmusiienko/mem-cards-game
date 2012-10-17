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
    [testField setwidth:2 AndHeight:3];
    [testField generateRandomField];
    int padding=2;
    int cellwidth= 320/[testField getWidth];
    int cellhight= 350/[testField getHeight];
    for (int row=0;row<[testField getWidth];row++){
        for (int cell=0;cell<[testField getHeight];cell++){
            int left =row*cellwidth +padding/2;            
            int top =cell*cellhight+50;            
            MCCard *card=[[MCCard alloc] initWithCardId:[testField cardIDForX:row andY:cell]];
            card.frame=CGRectMake(left, top, cellwidth-padding, cellhight-padding);
            [self.view addSubview:card];
        }
    }

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
