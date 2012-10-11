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
{
    NSMutableArray *myArrey;
    int image_count;;
    int card_count;
}
@end

@implementation MCGameField
 
-(void) generateRandomField {
    
if(card_count==0){        
   for(int j=1;j<=2;j++){
        for(int i=1;i<=image_count;i++){
            [myArrey addObject:[NSString stringWithFormat:@"%d",i]];            
        }     
    } 
    for (int x = 0; x < [myArrey count]; x++) {
        int randInt = (arc4random() % ([myArrey count] - x)) + x;
        [myArrey exchangeObjectAtIndex:x withObjectAtIndex:randInt];
    }
}      
NSLog(@"%@",[myArrey objectAtIndex:card_count]);

    
}

-(void) setwidthAndHeight:(int) x:(int) y{
    
    image_count=x*y/2;     
    card_count=0;    
    myArrey =[[NSMutableArray alloc] init];
    int kil=0;
    for(int i=1;i<=y;i++){
        for(int j=1;j<=x;j++){             
            [self generateRandomField ];
            card_count++;
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
