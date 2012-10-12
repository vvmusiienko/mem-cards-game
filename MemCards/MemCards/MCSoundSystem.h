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
    AVAudioPlayer *sound;
}
@property (nonatomic, retain) AVAudioPlayer *sound;

+(MCSoundSystem *) sharedSoundSystem;
-(void) playEffect: (NSString*) effectName;
@end