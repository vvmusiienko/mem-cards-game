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
    int fieldWidth;
    int fieldHeight;   
    int image_count;
    int card_count;
}
@end

@implementation MCGameField

- (int) cardIDForX:(int)x andY:(int)y{
    int cardId=0;
    int kil=fieldWidth*(x-1)+y;
    for (int i=1;i<kil;i++){        
        cardId++;
        
    }
    int result=[[myArrey objectAtIndex:cardId] intValue];
return result;
}

-(int)getWidth{
    int imageWidth=320/fieldWidth-10;
    return imageWidth;
}

-(int) getHeight{
    int imageHeight=460/fieldHeight-10;
    return imageHeight;
}

-(void)printLevel{
    
    [self setwidth:2 AndHeight:3];      
    [self generateRandomField];
    NSLog(@"CardId with position [2][2] is  %d\n", [self cardIDForX:2 andY:2]);  
    
    

}

-(void) setwidth:(int) width AndHeight:(int) height{
    fieldWidth=width;
    fieldHeight=height;
    
}

-(void) generateRandomField {
    image_count=fieldHeight*fieldWidth/2;
    card_count=0;   
if(card_count==0){     
    myArrey =[[NSMutableArray alloc] init];
    
   for(int j=1;j<=2;j++){
        for(int i=1;i<=image_count;i++){
            [myArrey addObject:[NSString stringWithFormat:@"%d",i]];            
        }     
    } 
    
    for (int x = 0; x < [myArrey count]; x++) {
        int randInt = (arc4random() % ([myArrey count] - x)) + x;
        [myArrey exchangeObjectAtIndex:x withObjectAtIndex:randInt];
    }    
    
    for(int i=1;i<=fieldHeight;i++){
        for(int j=1;j<=fieldWidth;j++){             
            //NSLog(@"%@",[myArrey objectAtIndex:card_count] );
           printf("%d   ",[[myArrey objectAtIndex:card_count] intValue]);
            card_count++;
            
        }
        printf("\n");
    }
}      
  
    
}




@end
