//
//  MCViewController.m
//  MemCards
//
//  Created by Vova Musiienko on 28.09.12.
//  Copyright (c) 2012 Vova Musiienko. All rights reserved.
//

#import "MCViewController.h"
#import "MCGameField.h"

@interface MCViewController ()

@end

@implementation MCViewController

-(IBAction) viewClick:(id)sender{


}

- (void)viewDidLoad
{
    [super viewDidLoad];   
    MCGameField *outMes=[[MCGameField alloc] init];
    [outMes setwidth:2 AndHeight:3];      
    [outMes generateRandomField];
    [outMes  printLevel];
    NSLog(@"CardId with position  [0][0] is  %d\n", [outMes cardIDForX:0 andY:0]);  
    NSLog(@"CardId with position  [1][0] is  %d\n", [outMes cardIDForX:1 andY:0]);  
    NSLog(@"CardId with position  [0][1] is  %d\n", [outMes cardIDForX:0 andY:1]);  
    NSLog(@"CardId with position  [1][1] is  %d\n", [outMes cardIDForX:1 andY:1]);  
    NSLog(@"CardId with position  [0][2] is  %d\n", [outMes cardIDForX:0 andY:2]);  
    NSLog(@"CardId with position  [1][2] is  %d\n", [outMes cardIDForX:1 andY:2]);  
    NSLog(@"CardId in position with coordinates [0][0] is  %d\n", [outMes cardIDInThePointX:0 andY:0]);  
    NSLog(@"CardId in position with coordinates [320][460] is  %d\n", [outMes cardIDInThePointX:320 andY:460]);  
    
 // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
   [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
