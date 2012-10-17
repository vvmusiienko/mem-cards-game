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
    int imageWidth;
    int imageHeight;
    int image_count;
    int card_count;
}
@end

@implementation MCGameField

- (int) cardIDInThePointX:(int)x andY:(int)y{
    int width=imageWidth;
    int height=imageHeight;
    int atX;
    int atY;    
    if ((x> width )&&(x%width!=0)) {        
        atX=x/width+1;
        if(atX>fieldWidth){
            atX=atX-1;
        }              
    }
    if (x%width==0) {
        atX =x/width;
    }
    if (x<=width) {
        atX= 1;  
    }    
    
    if ((y> height )&&(y%height!=0)) {
      atY=y/height+1;        
        if (atY>fieldHeight){
            atY=atY-1;
        }
    }
    if (y%height==0) {
        atY =y/height;
    }
    if (y<=height) {
        atY= 1;  
    }  
   
    int result=[self cardIDForX:atX-1 andY:atY-1];
    return result;
}


- (int) cardIDForX:(int)x andY:(int)y{
    int position_in_array=fieldWidth*y+x;
    int result=[[myArrey objectAtIndex:position_in_array] intValue];
return result;
}

-(int)getWidth{
    
    return fieldWidth;
}

-(int) getHeight{
   return fieldHeight;
}

-(void)printLevel{    
    
    card_count=0;   

    for(int i=1;i<=fieldHeight;i++){
        for(int j=1;j<=fieldWidth;j++){             
            //NSLog(@"%@",[myArrey objectAtIndex:card_count] );
            printf("%d   ",[[myArrey objectAtIndex:card_count] intValue]);
            card_count++;
            
        }
        printf("\n");
    }


    
    

}

-(void) setwidth:(int) width AndHeight:(int) height{
    fieldWidth=width;
    fieldHeight=height;
     imageWidth=320/width;
    imageHeight=460/height;
    
}

-(void) generateRandomField {
    image_count=fieldHeight*fieldWidth/2;
    int repeatCard=0;
    if (image_count<=8) {
        image_count=image_count;
        repeatCard=2;
    }else {
        image_count=8;
        repeatCard=fieldWidth*fieldHeight/8;
    }
  
    myArrey =[[NSMutableArray alloc] init];
    
   for(int j=1;j<=repeatCard;j++){
        for(int i=1;i<=image_count;i++){
            [myArrey addObject:[NSString stringWithFormat:@"%d",i]];            
        }     
    } 
    
    for (int x = 0; x < [myArrey count]; x++) {
        int randInt = (arc4random() % ([myArrey count] - x)) + x;
        [myArrey exchangeObjectAtIndex:x withObjectAtIndex:randInt];
    }    
    
}

@end
