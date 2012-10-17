//
//  MCSoundSystem.h
//  MemCards
//
//  Created by wasja on 10/12/12.
//  Copyright (c) 2012 Vova Musiienko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>


@interface MCSoundSystem : NSObject {
    AVAudioPlayer *effect;
    AVAudioPlayer *music;
    
}
@property (nonatomic, retain) AVAudioPlayer *effect;
@property (nonatomic, retain) AVAudioPlayer *music;

+(MCSoundSystem *) sharedSoundSystem;
-(void) playEffect: (NSString*) effectName;
-(void) playMusic: (NSString*) effectName;
-(void) play;
-(void) pause;
@end