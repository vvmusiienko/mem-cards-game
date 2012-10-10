//
//  MCGameField.m
//  MemCards
//
//  Created by bogash on 10.10.12.
//  Copyright (c) 2012 Vova Musiienko. All rights reserved.
//

#import "MCGameField.h"
#include <stdio.h>
@interface MCGameField ()

@end

@implementation MCGameField

-(void) generateRandomField {
  
}

-(void) setwidthAndHeight:(int) x:(int) y{
    NSMutableArray *myArrey =[[NSMutableArray alloc] init] ;
    int count =x*y/2;
   
    for(int j=1;j<=2;j++){
        for(int i=1;i<=count;i++){
            [myArrey addObject:[NSString stringWithFormat:@"%d",i]];
            
        }     
    }  
    
    for (int x = 0; x < [myArrey count]; x++) {
        int randInt = (arc4random() % ([myArrey count] - x)) + x;
        [myArrey exchangeObjectAtIndex:x withObjectAtIndex:randInt];
    }
    
    int kil=0;
    
    for(int i=1;i<=y;i++){
        for(int j=1;j<=x;j++){         
            NSLog(@"%@",[myArrey objectAtIndex:kil]); 
            kil++;
        }
    NSLog(@"\n");
}


}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
