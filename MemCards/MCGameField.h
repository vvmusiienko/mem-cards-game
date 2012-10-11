//
//  MCGameField.h
//  MemCards
//
//  Created by bogash on 10.10.12.
//  Copyright (c) 2012 Vova Musiienko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCGameField : NSObject


{

}
-(void)printLevel;
-(void) setwidth:(int) width AndHeight:(int) height;
-(void) generateRandomField;  
-(int)getWidth;
-(int) getHeight;
@end
